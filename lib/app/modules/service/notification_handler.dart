import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Message received in background: ${message.notification?.title}');
}

class FirebaseMessagingHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final androidChannel = const AndroidNotificationChannel(
    'channel_notification',
    'High Importance Notification',
    description: 'Used For Notification',
    importance: Importance.defaultImportance,
  );

  final localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initPushNotification() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');

    _firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });
    //handler terminated message
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        if (message.notification != null) {
          log("terminatedNotification : ${message.notification?.title}");
        }
      }
    });
    //handler onbackground message
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // handler on local notification
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                androidChannel.id, androidChannel.name,
                channelDescription: androidChannel.description,
                icon: '@mipmap/ic_launcher')),
        payload: jsonEncode(message.toMap()),
      );
      log('Message received while app is in foreground: ${message.notification?.title}');
    });

    // handler when open the message
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message opened from notification: ${message.notification?.title}');
    });
  }

  Future initLocalNotification() async {
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: ios);
    await localNotification.initialize(settings);
  }
}
