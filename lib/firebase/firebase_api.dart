import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:transport/firebase/firebase.dart';
import 'dart:typed_data';
import '../firebase_options.dart';

Future<void> handleBackgroundMessaging(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseController firebaseController = Get.put(FirebaseController());

  final _androidChannel = AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for important notification',
      playSound: true,
      showBadge: true,
      enableVibration: true,
      vibrationPattern: Int64List.fromList([0, 500, 200, 500]),
      importance: Importance.high);
  final _localNotifications = FlutterLocalNotificationsPlugin();
  void handleMessage(RemoteMessage? message) async {
    if (message == null) return;
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    print("fjhbf");
    if (notification != null && android != null) {
      if (message.data.isNotEmpty) {
        // print(message.data);
        // switch (int.parse(message.data["status"])) {
        //   case 0:
        //     FeedController feedController = Get.put(FeedController());
        //     await Future.wait([
        //       feedController.announcementHome(),
        //       feedController.anniversaryHome(),
        //       feedController.birthdayHome()
        //     ]);
        //     firebaseController.setCurrentIndex(value: 0);
        //     break;
        //   case 1:
        //     firebaseController.setCurrentIndex(value: 1);
        //     break;
        //   case 2:
        //     LeaveController leaveController = Get.put(LeaveController());
        //     await Future.wait([
        //       leaveController.leavesTypeHome(),
        //       leaveController.leavesHome()
        //     ]);
        //     firebaseController.setCurrentIndex(value: 2);
        //     break;
        //   case 3:
        //     ServiceRequestController serviceRequestController =
        //         Get.put(ServiceRequestController());
        //     await Future.wait([
        //       serviceRequestController.serviceTypeHome(),
        //       serviceRequestController.services()
        //     ]);
        //     firebaseController.setCurrentIndex(value: 3);
        //     break;
        // }
      }
    }
  }

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (payload) {
      final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
      handleMessage(message);
    });
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              iOS: const DarwinNotificationDetails(
                  presentBanner: true,
                  presentAlert: true,
                  presentBadge: true,
                  presentSound: true),
              android: AndroidNotificationDetails(
                  _androidChannel.id, _androidChannel.name,
                  channelDescription: _androidChannel.description,
                  playSound: true,
                  enableVibration: true,
                  channelShowBadge: true,
                  vibrationPattern: Int64List.fromList([0, 500, 200, 500]),
                  icon: '@mipmap/ic_launcher',
                  priority: Priority.high,
                  ticker: 'ticker',
                  importance: Importance.high)),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
        sound: true, badge: true, alert: true);

    await _firebaseMessaging.getToken().then((token) {
      // print('Device Token FCM: $token');
      debugPrint('Device Token FCM: $token');
      firebaseController.fcmToken(token);
    });
    initPushNotifications();
    initLocalNotifications();
  }
}
