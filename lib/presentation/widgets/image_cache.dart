import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

class ImageCustomCache extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final Size? size;
  final BoxFit? fit;
  final bool showLoading;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry padding;
  final String? imgDefault;

  const ImageCustomCache(
    this.imageUrl, {
    this.tag = 'tag',
    this.size,
    this.fit,
    this.showLoading = false,
    this.radius,
    this.padding = EdgeInsets.zero,
    this.borderRadius,
    this.imgDefault,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: imageUrl.trim().isNotEmpty,
      replacement: _error(),
      child: Padding(
        padding: padding,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
          child: Hero(
            tag: tag,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: size?.width,
              height: size?.height,
              fit: fit,
              placeholder:
                  showLoading ? (context, url) => _placeHolder() : null,
              errorWidget: (context, url, error) => _error(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeHolder() {
    return Container(
      width: size?.width,
      height: size?.height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _error() {
    return Center(
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
        child: Hero(
          tag: 'tag_$imageUrl',
          child: Image.asset(
            imgDefault ?? Constants.LOGO,
            width: size?.width,
            height: size?.height,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
