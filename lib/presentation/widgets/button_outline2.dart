import 'package:flutter/material.dart';

class ButtonOutline2Stream extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Stream<bool>? stream;
  final String text;
  final double sizeIcon;
  final TextStyle? styleText;
  final ButtonStyle? buttonStyle;

  const ButtonOutline2Stream(
      {required this.text,
      this.stream,
      this.sizeIcon = 24.0,
      this.onPressed,
      this.onLongPress,
      this.buttonStyle,
      this.styleText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: stream,
        initialData: false,
        builder: (context, snap) {
          return OutlinedButton(
            style: buttonStyle,
            key: key,
            onPressed: snap.data! ? null : onPressed,
            onLongPress: onLongPress,
            child: Text(text, style: styleText),
          );
        });
  }
}
