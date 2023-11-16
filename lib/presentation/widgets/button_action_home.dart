import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ButtonAction extends StatefulWidget {
  final Widget child;
  final int milliseconds;
  final int delay;
  final Color color1;
  final Color color2;
  final bool animated;
  final void Function()? onTap;
  final void Function()? onLongPress;
  const ButtonAction(
      {required this.color1,
      required this.color2,
      required this.child,
      this.milliseconds = 700,
      this.delay = 100,
      this.animated = false,
      this.onTap,
      this.onLongPress,
      super.key});

  @override
  State<ButtonAction> createState() => _ButtonActionState();
}

class _ButtonActionState extends State<ButtonAction> {
  bool t1 = false;
  late Timer timer;

  @override
  void initState() {
    timer =
        Timer.periodic(Duration(milliseconds: widget.milliseconds), (timer) {
      if (widget.animated) {
        setState(() => t1 = !t1);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: FadeIn(
          delay: Duration(milliseconds: widget.delay),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999999),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99999),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99999),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: widget.milliseconds),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99999),
                    boxShadow: [
                      BoxShadow(
                        color: t1 ? widget.color1 : widget.color2,
                        blurRadius: 1,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
