import 'package:flutter/material.dart';

class ButtonToStartScroll extends StatelessWidget {
  final bool visible;
  final VoidCallback? onPressed;
  final Color? colorBackground;
  final Color colorForeground;

  const ButtonToStartScroll(
      {this.visible = true,
      required this.onPressed,
      this.colorBackground,
      this.colorForeground = Colors.white,
      super.key});

  static Widget? loadingWidget(bool visible) =>
      visible ? const LinearProgressIndicator(minHeight: 2) : null;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: FloatingActionButton.small(
        onPressed: onPressed,
        backgroundColor: colorBackground,
        child: Icon(
          Icons.arrow_drop_up,
          color: colorForeground,
        ),
      ),
    );
  }
}
