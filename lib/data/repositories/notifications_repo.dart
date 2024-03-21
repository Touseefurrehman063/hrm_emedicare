import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); // to show notification

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitilization =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitilization = const DarwinInitializationSettings();
    var initializationSetting = InitializationSettings(
      android: androidInitilization,
      iOS: iosInitilization,
    );
    // when app open
    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      handelMessage(context, message);
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  getDeviceToken() {
    messaging.getToken().then((value) async {
      Prefs().saveDeviceToken(value.toString());
    });
  }

  isTokenRefresh() {
    // just call in main = only called when old token is expired
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      Prefs().saveDeviceToken(event.toString());
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (kDebugMode) {
        print("notifications title:${notification!.title}");
        print("notifications body:${notification.body}");
        print('count:${android!.count}');
        print('data:${message.data.toString()}');
      }

      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotifications(message);
      }
    });
  }

  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      // sound: true,
    );
  }

  Future<void> showNotifications(RemoteMessage message) async {
    try {
      // WHEN APP ACTIVE
      // ANDROID
      AndroidNotificationChannel channel = AndroidNotificationChannel(
        message.notification!.android!.channelId.toString(),
        message.notification!.android!.channelId.toString(),
        importance: Importance.max,
        showBadge: true,
        // playSound: true,
        // sound: const RawResourceAndroidNotificationSound('jetsons_doorbell'),
      );

      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        channel.id.toString(), channel.name.toString(),
        channelDescription: 'your channel description',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        ticker: 'ticker',
        // sound: channel.sound,
      );
// IOS
      DarwinNotificationDetails darwinNotificationDetails =
          const DarwinNotificationDetails(
              presentAlert: true, presentBadge: true, presentSound: true);

      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: darwinNotificationDetails);

      Future.delayed(Duration.zero, () {
        _flutterLocalNotificationsPlugin.show(
          0,
          message.notification?.title.toString(),
          message.notification?.body.toString(),
          notificationDetails,
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void handelMessage(BuildContext context, RemoteMessage message) {
    // redirect to specific screen code only for android and not in background
    if (message.data['type'] == 'msg') {
      // send id = messae.date['id']
      print('objectaaaa');
      // Get.to(() => EditProfile());
    }
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(
    BuildContext context,
  ) async {
    // when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handelMessage(context, initialMessage);
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handelMessage(context, event);
    });
  }
}
