// ignore: unused_import
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';
import 'api_services.dart';
import '../endpoints.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  ///
  static final onNotifications = BehaviorSubject<String?>();

  ///
  static final StreamController<String?> selectNotificationStream =
      StreamController<String?>.broadcast();

  ///
  static const String channelId = 'com.channel.id';

  ///
  static const String channelName = 'channelName';

  ///
  static const String channelDescription = 'channel Description from App';

  ///
  static const String icon = 'drawable/ic_notification';

  static Future<NotificationDetails> _notificationDetail({
    AndroidNotificationDetails? android,
    DarwinNotificationDetails? iOS,
    String? channelID,
    String? channelNAME,
    String? channelDESC,
  }) async {
    return NotificationDetails(
      android: android ??
          AndroidNotificationDetails(
            channelID ?? channelId,
            channelNAME ?? channelName,
            channelDescription: channelDESC ?? channelDescription,
            icon: icon,
            importance: Importance.max,
          ),
      iOS: iOS ?? const DarwinNotificationDetails(),
    );
  }

  static Future get initialize async {
    // permission notifications show
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    // init
    const android = AndroidInitializationSettings(icon);
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) async {
        onNotifications.add(response.actionId);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  static Future<void> init() async {
    await _isAndroidPermissionGranted();
    await _requestPermissions();
    // _configureDidReceiveLocalNotificationSubject();
    // _configureSelectNotificationSubject();
  }

  static Future<bool> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await _notifications
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      return granted;
    }
    return false;
  }

  static Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await _notifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await _notifications
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _notifications.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
          await androidImplementation?.requestNotificationsPermission();

      debugPrint(
          'requestPermissions: ${grantedNotificationPermission ?? false}');
    }
  }

/*   void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationStream.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        SecondPage(receivedNotification.payload),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  } */

  // ==========================

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    bool playSound = true,
    AndroidNotificationDetails? androidNotificationDetails,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetail(
          android: androidNotificationDetails,
        ),
        payload: payload,
      );

  static Future<void> showPersistentNotificationWithButton({
    int id = 1,
    String? title,
    String? body,
    String? channelID = 'onBackground',
    String? channelNAME = 'Services on Background',
    String? channelDESC,
    String payload = 'alertServices',
  }) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelID ?? channelId,
      channelNAME ?? channelName,
      channelDescription: channelDESC ?? channelDescription,
      ticker: 'ticker',
      importance: Importance.max,
      priority: Priority.max,
      playSound: false,
      enableVibration: false,
      showWhen: false,
      ongoing: true,
      autoCancel: false,
      enableLights: true,
      visibility: NotificationVisibility.public,
      category: AndroidNotificationCategory.service,
      actions: const <AndroidNotificationAction>[
        AndroidNotificationAction(
          ActionID.sos,
          'SOS',
          cancelNotification: false,
        ),
        AndroidNotificationAction(
          ActionID.fire,
          'Fuego',
          cancelNotification: false,
        ),
        AndroidNotificationAction(
          ActionID.medic,
          'Medico',
          cancelNotification: false,
        ),
        AndroidNotificationAction(
          ActionID.sos,
          'Policía',
          cancelNotification: false,
        ),
        /* AndroidNotificationAction(
          ActionID.myRed,
          'Mi Red',
          cancelNotification: false,
        ), */
      ],
    );

    await _notifications.show(
        id,
        title,
        body,
        await _notificationDetail(
          android: androidPlatformChannelSpecifics,
          channelID: 'onBackground',
          channelNAME: 'Services on Background',
        ),
        payload: payload);
  }
}

class ActionID {
  static const String sos = 'send_sos';
  static const String fire = 'send_fire';
  static const String medic = 'send_medic';
  static const String police = 'send_police';
  static const String myRed = 'send_myRed';
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  final actionId = notificationResponse.actionId ?? 'N/A';
  Map<String, dynamic>? json;

  final t1 = 'notification(${notificationResponse.id}) action tapped:';
  final t2 = '$actionId with payload: ${notificationResponse.payload}';
  debugPrint('$t1 $t2');

  if (ActionID.sos == actionId) {
    json = const {};
  } else if (ActionID.fire == actionId) {
    json = const {};
  } else if (ActionID.medic == actionId) {
    json = const {};
  } else if (ActionID.police == actionId) {
    json = const {};
  } else if (ActionID.myRed == actionId) {
    json = const {};
  }

  if (json != null) sendAlert(json);

  if (notificationResponse.input?.isNotEmpty ?? false) {
    const t1 = 'notification action tapped with input:';
    debugPrint('$t1 ${notificationResponse.input}');
  }
}

Future<void> sendAlert(Map<String, dynamic> json) async {
  final url = Uri.parse(url_base + Endpoint.login);
  ApiServices.GET(url: url);
}
