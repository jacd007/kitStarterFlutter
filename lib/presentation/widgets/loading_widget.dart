import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({this.size = 24.0, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.1),
      child: const CircularProgressIndicator(),
    );
  }
}
