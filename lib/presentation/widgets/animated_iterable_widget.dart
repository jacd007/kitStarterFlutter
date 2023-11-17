// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum StaggeredAnimationsType {
  fadeIn,
  slide,
  scale,
  flip,

  /// Not animations
  none,
}

enum StaggeredIterableType {
  /// List
  list,

  /// Grid
  grid,

  /// Column
  column,
}

///
/// [T] type `data`
///
/// ...
///
/// [T] is `Widget`
/// ```
/// builder: (_, widget) => widget,
/// list: <Widget>[...],
/// ```
///
class AnimatedIterableWidgets<T> extends StatelessWidget {
  final StaggeredIterableType type;
  final StaggeredAnimationsType animationParent;
  final StaggeredAnimationsType animationChild;

  final Widget Function(int, T) builder;
  final List<T> children;

  const AnimatedIterableWidgets({
    required this.type,
    required this.builder,
    required this.children,
    this.animationParent = StaggeredAnimationsType.scale,
    this.animationChild = StaggeredAnimationsType.fadeIn,
    this.crossAxisCount = 2,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.physics,
    this.primary,
    this.reverse = false,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.duration = const Duration(milliseconds: 375),
    this.delay,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    super.key,
  });

  final int crossAxisCount;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final EdgeInsetsGeometry padding;
  final bool? primary;
  final bool reverse;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final Duration duration;
  final Duration? delay;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double? mainAxisExtent;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;

  static Widget Function(int, Widget) get defaultBuilder =>
      (_, widget) => widget;

  Widget _animation(StaggeredAnimationsType type, Widget child) {
    if (type == StaggeredAnimationsType.fadeIn) {
      return FadeInAnimation(child: child);
    } else if (type == StaggeredAnimationsType.flip) {
      return FlipAnimation(child: child);
    } else if (type == StaggeredAnimationsType.scale) {
      return ScaleAnimation(child: child);
    } else if (type == StaggeredAnimationsType.slide) {
      return SlideAnimation(child: child);
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (type == StaggeredIterableType.list) {
      return _ListWithSlideAndFade(
        builder: builder,
        list: children,
        controller: controller,
        padding: padding,
        physics: physics,
        primary: primary,
        reverse: reverse,
        scrollDirection: scrollDirection,
        duration: duration,
        delay: delay,
        childAnimation: (child) => _animation(animationChild, child),
        parentAnimation: (parent) => _animation(animationParent, parent),
      );
    } else if (type == StaggeredIterableType.grid) {
      return _GridWithSlideAndFade(
        builder: builder,
        children: children,
        crossAxisCount: crossAxisCount,
        controller: controller,
        padding: padding,
        physics: physics,
        primary: primary,
        reverse: reverse,
        scrollDirection: scrollDirection,
        duration: duration,
        delay: delay,
        childAnimation: (child) => _animation(animationChild, child),
        parentAnimation: (parent) => _animation(animationParent, parent),
      );
    } else {
      return _ColumnWithSlideAndFade(
        builder: builder,
        children: children,
        controller: controller,
        padding: padding,
        physics: physics,
        primary: primary,
        reverse: reverse,
        scrollDirection: scrollDirection,
        duration: duration,
        delay: delay,
        childAnimation: (child) => _animation(animationChild, child),
        parentAnimation: (parent) => _animation(animationParent, parent),
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        listWidget: (T is Widget) ? (children as List<Widget>) : null,
      );
    }
  }
}

class StaggeredAnimationsConfiguration<T> {
  StaggeredIterableType type;
  StaggeredAnimationsType animationParent;
  StaggeredAnimationsType animationChild;

  Widget Function(int, T) builder;
  List<T> list;
  List<Widget>? children;

  StaggeredAnimationsConfiguration({
    required this.type,
    required this.animationParent,
    required this.animationChild,
    required this.builder,
    required this.list,
    this.children,
    this.crossAxisCount = 2,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.physics,
    this.primary,
    this.reverse = false,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.duration = const Duration(milliseconds: 375),
    this.delay,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) {
    if (T is Widget) children = (list as List<Widget>);
  }

  int crossAxisCount;
  ScrollPhysics? physics;
  ScrollController? controller;
  EdgeInsetsGeometry padding;
  bool? primary;
  bool reverse;
  bool shrinkWrap;
  Axis scrollDirection;
  Duration duration;
  Duration? delay;
  double mainAxisSpacing;
  double crossAxisSpacing;
  double childAspectRatio;
  double? mainAxisExtent;
  MainAxisAlignment mainAxisAlignment;
  MainAxisSize mainAxisSize;
  CrossAxisAlignment crossAxisAlignment;
  TextDirection? textDirection;
  VerticalDirection verticalDirection;
}

//==============================================================

///
/// Animated List Builder with  SlideAnimation and FadeAnimation
///
class _ListWithSlideAndFade<T> extends StatelessWidget {
  final Widget Function(int, T) builder;
  final List<T> list;
  final Widget Function(Widget) childAnimation;
  final Widget Function(Widget) parentAnimation;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final bool? primary;
  final bool reverse;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final Duration duration;
  final Duration? delay;
  final EdgeInsetsGeometry? padding;

  const _ListWithSlideAndFade({
    required this.builder,
    required this.list,
    required this.parentAnimation,
    required this.childAnimation,
    this.padding,
    this.controller,
    this.physics,
    this.primary,
    this.reverse = false,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.duration = const Duration(milliseconds: 375),
    this.delay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: padding,
        itemCount: list.length,
        shrinkWrap: shrinkWrap,
        controller: controller,
        physics: physics,
        reverse: reverse,
        primary: primary,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: duration,
            delay: delay,
            child: parentAnimation(
              childAnimation(
                builder(index, list[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

///
///
///
class _GridWithSlideAndFade<T> extends StatelessWidget {
  final Widget Function(int, T) builder;
  final List<T> children;
  final int crossAxisCount;
  final Widget Function(Widget) childAnimation;
  final Widget Function(Widget) parentAnimation;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final bool? primary;
  final bool reverse;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final Duration duration;
  final Duration? delay;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double? mainAxisExtent;
  final EdgeInsetsGeometry? padding;

  const _GridWithSlideAndFade({
    required this.builder,
    required this.children,
    required this.crossAxisCount,
    required this.parentAnimation,
    required this.childAnimation,
    this.controller,
    this.physics,
    this.primary,
    this.shrinkWrap = false,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.duration = const Duration(milliseconds: 375),
    this.delay,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: children.length,
        shrinkWrap: shrinkWrap,
        controller: controller,
        padding: padding,
        physics: physics,
        reverse: reverse,
        primary: primary,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: duration,
            delay: delay,
            child: parentAnimation(
              childAnimation(
                builder(index, children[index]),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          mainAxisExtent: mainAxisExtent,
        ),
      ),
    );
  }
}

///
/// Animated List Builder with  SlideAnimation and FadeAnimation
///
class _ColumnWithSlideAndFade<T> extends StatelessWidget {
  final Widget Function(int, T) builder;
  final List<T> children;
  final List<Widget>? listWidget;
  final Widget Function(Widget) childAnimation;
  final Widget Function(Widget) parentAnimation;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final bool? primary;
  final bool reverse;
  final Axis scrollDirection;
  final Duration duration;
  final Duration? delay;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final EdgeInsetsGeometry? padding;

  const _ColumnWithSlideAndFade({
    required this.builder,
    required this.children,
    required this.parentAnimation,
    required this.childAnimation,
    this.listWidget,
    this.controller,
    this.padding,
    this.physics,
    this.primary,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.duration = const Duration(milliseconds: 375),
    this.delay,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      physics: physics,
      reverse: reverse,
      primary: primary,
      padding: padding,
      child: AnimationLimiter(
        child: Column(
          children: listWidget != null
              ? AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => parentAnimation(
                    childAnimation(widget),
                  ),
                  children: listWidget!,
                )
              : [
                  for (int index = 0; index < children.length; index++)
                    AnimationConfiguration.staggeredList(
                      position: index,
                      duration: duration,
                      delay: delay,
                      child: parentAnimation(
                        childAnimation(
                          builder(index, children[index]),
                        ),
                      ),
                    ),
                ],
        ),
      ),
    );
  }
}
