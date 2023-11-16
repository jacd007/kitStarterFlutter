import 'dart:async';

import 'package:flutter/material.dart';

class IconAnimatedScale extends StatefulWidget {
  final bool favorite;
  final IconData iconData;
  final IconData? iconData2;
  final double size;
  final void Function(bool) onChanged;

  const IconAnimatedScale(
      {required this.iconData,
      required this.onChanged,
      this.iconData2,
      this.favorite = false,
      this.size = 24.0,
      super.key});

  @override
  State<IconAnimatedScale> createState() => _IconAnimatedScaleState();
}

class _IconAnimatedScaleState extends State<IconAnimatedScale> {
  bool favorite = false;
  double scale = 1.0;

  @override
  void initState() {
    favorite = widget.favorite;
    super.initState();
  }

  animated() async {
    setState(() => scale = 1.5);
    Timer(const Duration(milliseconds: 250), () {
      setState(() {
        scale = 1.0;
        favorite = !favorite;
        widget.onChanged(favorite);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final def = widget.iconData2 ?? widget.iconData;

    return IconButton(
      onPressed: () => animated(),
      icon: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: scale,
        child: Stack(children: [
          Icon(
            widget.iconData,
            size: widget.size,
            color: Colors.black.withOpacity(.1),
          ),
          Icon(
            widget.iconData,
            size: widget.size,
            color: Colors.white.withOpacity(.2),
          ),
          Icon(
            favorite ? widget.iconData : def,
            size: widget.size,
            color: favorite
                ? Colors.red.withOpacity(.9)
                : Colors.white.withOpacity(.8),
          ),
        ]),
      ),
    );
  }
}
