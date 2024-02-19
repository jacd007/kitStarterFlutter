import 'package:flutter/widgets.dart';

Widget exitToApp({
  required Widget child,
  required Future<bool> Function(dynamic)? onPopInvoked,
  Future<bool> Function()? onWillPop,
}) {
  final onPop = (onPopInvoked != null)
      ? () => onPopInvoked(dynamic)
      : () => Future.value(true);

  // ignore: deprecated_member_use
  return WillPopScope(
    onWillPop: onWillPop ?? onPop,
    child: child,
  );
}
