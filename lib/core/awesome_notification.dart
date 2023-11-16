/* import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../core/core.dart';
import '../main.dart';

///
class AwesomeNotification {
  static final _notifications = AwesomeNotifications();

  ///
  static final onNotifications = BehaviorSubject<String?>();

  ///
  static const String channelKey = 'channelKey';

  ///
  static const String channelName = 'channelName';

  ///
  static const String channelGroupKey = 'channelGroupKey';

  ///
  static const String channelDescription =
      'channel Description from Kit Starter V3';

  ///
  static const String icon = 'drawable/ic_notification';

  ///
  static const String pathIcon = 'resource://drawable/ic_notification';

  /// INITIALIZE
  static Future get initialize async {
    await AwesomeNotifications().initialize(
        pathIcon,
        [
          NotificationChannel(
            channelGroupKey: channelGroupKey,
            channelKey: channelKey,
            channelName: channelName,
            channelDescription: channelDescription,
            // defaultColor:  const Color(0xFF9D50DD),
            ledColor: Colors.white,
            channelShowBadge: true,
            importance: NotificationImportance.Max,
            defaultPrivacy: NotificationPrivacy.Public,
            enableVibration: true,
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
            channelGroupkey: channelGroupKey,
            channelGroupName: channelGroupKey,
          )
        ],
        debug: true);
  }

  ///
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await _notifications.createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: body,
        payload: {"name": "$payload"},
        autoDismissible: false,
      ),
      actionButtons: [],
    );
  }

  ///
  static Future showPersistentNotificationWithButton({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await _notifications.createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: body,
        payload: {"name": "$payload"},
        autoDismissible: false,
        showWhen: false,
      ),
      actionButtons: [
        NotificationActionButton(
          key: ActionKey.sos,
          label: 'SOS',
          autoDismissible: false,
        ),
        NotificationActionButton(
          key: ActionKey.fire,
          label: 'Fuego',
          autoDismissible: false,
        ),
        NotificationActionButton(
          key: ActionKey.medic,
          label: 'Medico',
          autoDismissible: false,
        ),
        NotificationActionButton(
          key: ActionKey.police,
          label: 'Policía',
          autoDismissible: false,
        ),
        /*  NotificationActionButton(
            key: ActionKey.red,
            label: 'Mi Red',
            autoDismissible: false,
          ), */
      ],
    );
  }

  static actionStream() async {
    AwesomeNotifications().actionStream.listen((action) {
      if (action.buttonKeyPressed == ActionKey.sos) {
        debugPrint("SOS button is pressed");
        Utils.toast('SOS');
      } else if (action.buttonKeyPressed == ActionKey.fire) {
        debugPrint("FIRE button is pressed.");
        Utils.toast('FIRE');
      } else if (action.buttonKeyPressed == ActionKey.medic) {
        debugPrint("MEDIC button is pressed.");
      } else if (action.buttonKeyPressed == ActionKey.police) {
        debugPrint("POLICE button is pressed.");
      } else if (action.buttonKeyPressed == ActionKey.red) {
        debugPrint("RED button is pressed.");
      } else {
        debugPrint("${action.buttonKeyPressed} button is pressed.");
      }
    });
  }
}

class ActionKey {
  static String get sos => 'send_sos';
  static String get fire => 'send_fire';
  static String get medic => 'send_medic';
  static String get police => 'send_police';
  static String get red => 'send_socialWeb';
}

/// ************************************************
/// *************************  ***********************
/// ************************************************
class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/notification-page',
        (route) =>
            (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction);
  }
}
 */