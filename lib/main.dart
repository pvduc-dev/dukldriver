import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dukldriver/api/lib/openapi.dart';
import 'package:dukldriver/provider/api_provider.dart';
import 'package:dukldriver/provider/auth_provider.dart';
import 'package:dukldriver/screens/detail_trip_screen.dart';
import 'package:dukldriver/screens/incoming_trip_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flashy_flushbar/flashy_flushbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/account_screens.dart';
import 'screens/earnings_screen.dart';
import 'screens/home_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/phone_screen.dart';
import 'services/fcm_service.dart';

Future<void> requestLocationPermission() async {
  var status = await Permission.location.request();
  if (status.isDenied) {
    // Mở màn hình cài đặt để người dùng có thể cấp quyền vị trí
    await Geolocator.openLocationSettings();
    return;
  }
  if (await Permission.locationAlways.request().isGranted) {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token != null) {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.medium),
      );
      await sendLocationToBackend(position.latitude, position.longitude, token);
    }
  }
}

Future<void> initializeLocationService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
      autoStart: true,
      autoStartOnBoot: true,
      initialNotificationTitle: "Dịch vụ vị trí đang chạy",
      initialNotificationContent: "Ứng dụng đang theo dõi vị trí của bạn",
    ),
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
  service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  if (service is AndroidServiceInstance) {
    service.setForegroundNotificationInfo(
      title: "Dịch vụ vị trí",
      content: "Đang cập nhật vị trí...",
    );
  }

  // Lấy và gửi vị trí định kỳ
  Timer.periodic(Duration(seconds: 60), (timer) async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.medium),
    );
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token != null) {
      await sendLocationToBackend(position.latitude, position.longitude, token);
    }
  });
}

@pragma('vm:entry-point')
bool onIosBackground(ServiceInstance service) {
  return true;
}

Future<void> sendLocationToBackend(
  double latitude,
  double longitude,
  String token,
) async {
  Openapi(
    dio: Dio(
      BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        baseUrl: String.fromEnvironment(
          'API_URL',
          defaultValue: 'http://192.168.31.98:7111',
        ),
      ),
    ),
  ).getDriversApi().driversControllerUpdateDriverLocation(
    location: Location(coordinates: [longitude, latitude]),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Firebase
  await Firebase.initializeApp();

  await requestLocationPermission();

  await initializeLocationService();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider(context)),
      ],
      child: MaterialApp(
        title: 'Dukl Driver',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
          useMaterial3: true,
        ),
        home: Builder(
          builder: (context) {
            return Consumer<AuthProvider>(
              builder: (context, authProvider, child) => authProvider.isLoggedIn
                  ? const MainScreen()
                  : const PhoneScreen(),
            );
          },
        ),
        builder: FlashyFlushbarProvider.init(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => Consumer<AuthProvider>(
            builder: (context, authProvider, child) => authProvider.isLoggedIn
                ? const HomeScreen()
                : const PhoneScreen(),
          ),
          '/earnings': (context) => Consumer<AuthProvider>(
            builder: (context, authProvider, child) => authProvider.isLoggedIn
                ? const EarningsScreen()
                : const PhoneScreen(),
          ),
          '/notification': (context) => Consumer<AuthProvider>(
            builder: (context, authProvider, child) => authProvider.isLoggedIn
                ? const NotificationScreen()
                : const PhoneScreen(),
          ),
          '/account': (context) => Consumer<AuthProvider>(
            builder: (context, authProvider, child) => authProvider.isLoggedIn
                ? const AccountScreen()
                : const PhoneScreen(),
          ),
          '/phone': (context) => const PhoneScreen(),
          '/otp': (context) => const OtpScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name != null && settings.name!.startsWith('/trip/')) {
            final uri = Uri.parse(settings.name!);
            final tripId = uri.pathSegments.length > 1
                ? uri.pathSegments[1]
                : null;
            return MaterialPageRoute(
              builder: (context) => DetailTripScreen(tripId: tripId!),
              settings: settings,
            );
          }
          return null;
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    FCMService().initialize(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomeScreen(),
            EarningsScreen(),
            NotificationScreen(),
            AccountScreen(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        elevation: 8,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black26,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'Thu nhập',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
