import 'package:dio/dio.dart';
import 'package:dukldriver/api/lib/openapi.dart';
import 'package:dukldriver/screens/ride_detail_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FCMService {
  static final FCMService _instance = FCMService._internal();
  factory FCMService() => _instance;
  FCMService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<void> initialize(BuildContext context) async {
    if (_isInitialized) return;

    try {
      // Cấu hình local notifications trước
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
            requestAlertPermission: false, // Tắt request permission ở đây
            requestBadgePermission: false,
            requestSoundPermission: false,
          );
      const InitializationSettings initializationSettings =
          InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
          );

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          print('Notification clicked: ${response.payload}');
        },
      );

      // Sau đó mới request permission từ Firebase
      NotificationSettings settings = await _firebaseMessaging
          .requestPermission(
            alert: true,
            badge: true,
            sound: true,
            provisional: false,
          );

      print('User granted permission: ${settings.authorizationStatus}');

      // Lấy FCM token lần đầu và cập nhật lên server
      String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        final authToken = prefs.getString('auth_token');
        if (authToken != null) {
          Openapi(
            dio: Dio(
              BaseOptions(
                headers: {'Authorization': 'Bearer $authToken'},
                baseUrl: String.fromEnvironment(
                  'API_URL',
                  defaultValue: 'http://192.168.31.98:3111',
                ),
              ),
            ),
          ).getAuthApi().authControllerUpsertDeviceToken(
            updateDeviceTokenRequestDto: UpdateDeviceTokenRequestDto(
              token: token,
            ),
          );
        }
      }

      // Lắng nghe sự thay đổi của FCM token
      _firebaseMessaging.onTokenRefresh.listen((String token) async {
        final prefs = await SharedPreferences.getInstance();
        final authToken = prefs.getString('auth_token');
        if (authToken != null) {
          Openapi(
            dio: Dio(
              BaseOptions(
                headers: {'Authorization': 'Bearer $authToken'},
                baseUrl: String.fromEnvironment(
                  'API_URL',
                  defaultValue: 'http://192.168.31.98:3111',
                ),
              ),
            ),
          ).getAuthApi().authControllerUpsertDeviceToken(
            updateDeviceTokenRequestDto: UpdateDeviceTokenRequestDto(
              token: token,
            ),
          );
        }
      });

      // Xử lý thông báo khi app đang mở
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print(
            'Message also contained a notification: ${message.notification}',
          );
          // _showNotification(message);
          showDialog(
            context: context,
            builder: (context) =>
                Dialog.fullscreen(child: RideDetailScreen(rideId: "123")),
          );
        }
      });

      // Xử lý thông báo khi app đang ở background
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      // Xử lý khi người dùng click vào thông báo
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('Message clicked: ${message.data}');
        // TODO: Xử lý navigation dựa trên data của message
      });

      // Kiểm tra xem app có được mở từ thông báo không
      RemoteMessage? initialMessage = await _firebaseMessaging
          .getInitialMessage();
      if (initialMessage != null) {
        print(
          'App opened from terminated state by notification: ${initialMessage.data}',
        );
        // TODO: Xử lý navigation dựa trên data của message
      }

      _isInitialized = true;
    } catch (e) {
      print('Error initializing FCM: $e');
      rethrow;
    }
  }

  Future<void> _showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null) {
      await _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.max,
            priority: Priority.high,
            icon: android?.smallIcon ?? '@mipmap/ic_launcher',
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}

// Xử lý thông báo khi app đang ở background
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  // TODO: Xử lý thông báo khi app đang ở background
}
