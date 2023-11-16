import 'package:flutter/material.dart';

class ListViewHorizontalItems extends StatelessWidget {
  final double height;
  final ScrollController? controller;
  final Widget Function(int) createChild;
  final int itemCount;
  final Widget separatorChild;
  final EdgeInsetsGeometry padding;

  const ListViewHorizontalItems(
      {this.controller,
      this.height = 100.0,
      required this.createChild,
      required this.itemCount,
      this.separatorChild = const SizedBox.square(dimension: 2),
      this.padding = EdgeInsets.zero,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      child: ListView.separated(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => createChild(index),
        itemCount: itemCount,
        separatorBuilder: (BuildContext context, int index) => separatorChild,
      ),
    );
  }
}
