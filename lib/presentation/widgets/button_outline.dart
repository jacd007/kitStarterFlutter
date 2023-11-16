import 'package:flutter/material.dart';

class ButtonOutlineStream extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Stream<bool>? stream;
  final String text;
  final double sizeIcon;
  final Widget icon;
  final TextStyle? styleText;
  final ButtonStyle? buttonStyle;

  const ButtonOutlineStream(
      {required this.text,
      required this.icon,
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
          return OutlinedButton.icon(
            style: buttonStyle,
            key: key,
            onPressed: snap.data! ? null : onPressed,
            onLongPress: onLongPress,
            icon: snap.data!
                ? Container(
                    width: sizeIcon,
                    height: sizeIcon,
                    padding: EdgeInsets.all(sizeIcon * 0.1),
                    child: const CircularProgressIndicator(),
                  )
                : icon,
            label: Text(text, style: styleText),
          );
        });
  }
}
