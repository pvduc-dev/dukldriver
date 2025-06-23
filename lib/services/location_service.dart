import 'dart:async';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;

  LocationService._internal();

  static Future<void> requestLocationPermission() async {
    // Kiểm tra quyền truy cập vị trí
    var status = await Permission.location.status;

    if (status.isDenied) {
      // Yêu cầu quyền truy cập vị trí
      status = await Permission.location.request();
    }

    // Kiểm tra quyền truy cập vị trí trong background
    var backgroundStatus = await Permission.locationAlways.status;

    if (backgroundStatus.isDenied) {
      // Yêu cầu quyền truy cập vị trí trong background
      backgroundStatus = await Permission.locationAlways.request();
    }

    // Kiểm tra xem GPS có được bật không
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Yêu cầu người dùng bật GPS
      await Geolocator.openLocationSettings();
      return;
    }

    // Lưu trạng thái phân quyền
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('location_permission', status.isGranted);
    await prefs.setBool(
      'background_location_permission',
      backgroundStatus.isGranted,
    );
  }

  static Future<Position> getPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  @pragma('vm:entry-point')
  static Future<void> onStart(ServiceInstance service) async {
    if (service is AndroidServiceInstance) {
      service.setForegroundNotificationInfo(
        title: "Dịch vụ vị trí",
        content: "Đang cập nhật vị trí...",
      );
    }
    Timer.periodic(Duration(seconds: 60), (timer) async {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.medium),
      );
    });
  }

  @pragma('vm:entry-point')
  static bool onIosBackground(ServiceInstance service) {
    return true;
  }

  static void startBackgroundService() async {
    final service = FlutterBackgroundService();
    service.configure(
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
}
