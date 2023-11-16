import 'package:flutter/material.dart';

class ButtonTextStream extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Stream<bool>? stream;
  final String text;
  final double sizeIcon;
  final Widget icon;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;

  const ButtonTextStream(
      {required this.text,
      required this.icon,
      this.stream,
      this.sizeIcon = 24.0,
      this.onPressed,
      this.onLongPress,
      this.buttonStyle,
      this.textStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: stream,
        initialData: false,
        builder: (context, snap) {
          return TextButton.icon(
            onPressed: snap.data! ? null : onPressed,
            onLongPress: onLongPress,
            style: buttonStyle,
            key: key,
            icon: snap.data!
                ? Container(
                    width: sizeIcon,
                    height: sizeIcon,
                    padding: EdgeInsets.all(sizeIcon * 0.1),
                    child: const CircularProgressIndicator(),
                  )
                : icon,
            label: Text(
              text,
              style: textStyle,
            ),
          );
        });
  }
}
