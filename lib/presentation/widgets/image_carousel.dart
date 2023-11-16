import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../presentation.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> children;
  final List<String>? tags;
  final CarouselController carouselController;
  final double? radius;
  final double height;
  final double heightOptions;
  final int autoPlayInterval;
  final bool autoPlay;
  final double viewportFraction;
  final double positionScreenPercentage;
  final void Function(int) onTap;
  final double aspectRatio;
  final BoxFit fit;
  final String? imgDefault;

  const CarouselWidget({
    required this.children,
    required this.carouselController,
    required this.onTap,
    this.tags,
    this.height = 120,
    this.radius,
    this.autoPlayInterval = 15,
    this.heightOptions = 150.0,
    this.autoPlay = true,
    this.viewportFraction = 1.0,
    this.positionScreenPercentage = 0.35,
    this.aspectRatio = 16 / 9,
    this.fit = BoxFit.cover,
    this.imgDefault,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: height,
      child: Stack(children: [
        Positioned.fill(
          child: CarouselSlider(
            carouselController: carouselController,
            items: [
              for (int i = 0; i < children.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                    onTap: () => onTap(i),
                    child: ImageCustomCache(
                      children[i],
                      tag: tags?[i] ?? children[i],
                      fit: fit,
                      radius: radius,
                      imgDefault: imgDefault,
                      size: Size(size.width, height),
                    ),
                  ),
                )
            ],
            options: CarouselOptions(
              aspectRatio: aspectRatio,
              viewportFraction: viewportFraction,
              height: heightOptions,
              autoPlay: children.length > 1 ? autoPlay : false,
              autoPlayInterval: Duration(seconds: autoPlayInterval),
            ),
          ),
        ),
        Positioned(
          top: height * positionScreenPercentage,
          left: 0,
          right: 0,
          child: Visibility(
            visible: children.length > 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => carouselController.previousPage(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white60,
                    ),
                  ),
                  IconButton(
                    onPressed: () => carouselController.nextPage(),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white60,
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
