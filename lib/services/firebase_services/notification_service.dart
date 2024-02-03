import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:SL_Explorer/features/home/bottom_navigation.dart';
import 'package:SL_Explorer/features/home/home_page.dart';
import 'package:SL_Explorer/models/notification_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

Future<void> handleBackgroundMessage(RemoteMessage message)async{

}

class FirebaseNotificationApi{

  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.defaultImportance
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message){
    if(message==null) return;
    Get.to(HomePage(message: message,));
  }

  Future initLocalNotifications() async{
    // const ios = IOSInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _localNotifications.initialize(
      settings,
        onDidReceiveNotificationResponse: (payload){
        final message = RemoteMessage.fromMap(jsonDecode(payload.toString()));
        handleMessage(message);
      }
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);

  }


  Future initPushNotifications() async{

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );

    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen((handleMessage));
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if(notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/ic_launcher'
            )
          ),
        payload: jsonEncode(message.toMap())
      );

      final newNotification = NotificationModel(
          title: notification.title ?? '',
          body: notification.body ?? '',
          imgLink: notification.android!.imageUrl.toString() ?? '',
          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          time: DateFormat('HH:mm').format(DateTime.now()),
      );
      
      NotificationService.saveNotification(newNotification);


    });

  }

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Token : $fcmToken');
    initPushNotifications();
    initLocalNotifications();
  }
}


class NotificationService {
  static const _key = 'notifications';

  static Future<void> saveNotification(NotificationModel notification) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> notifications = prefs.getStringList(_key) ?? [];
    notifications.add(jsonEncode(notification.toJson()));
    await prefs.setStringList(_key, notifications);
  }

  static Future<List<NotificationModel>> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> notifications = prefs.getStringList(_key) ?? [];
    return notifications.map((json) =>
        NotificationModel.fromJson(jsonDecode(json))).toList();
  }

  static Future<void> deleteNotification(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> notifications = prefs.getStringList(_key) ?? [];

    notifications.removeWhere((json) {
      final decoded = jsonDecode(json);
      return decoded['id'] == id;
    });

    await prefs.setStringList(_key, notifications);
  }

}
