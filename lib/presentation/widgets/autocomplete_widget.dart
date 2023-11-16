import 'package:flutter/material.dart';

class AutoCompleteWidget<T> extends StatelessWidget {
  // important
  final TextEditingController controller;
  final FocusNode focusNode;
  final Color? colorBackground;
  final Color? colorBorder;
  final InputBorder? border;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int maxLines;
  final int minLines;
  final double elevation;
  final double radius;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;

  static Widget suffixIconDefault = const Icon(
    Icons.search,
    color: Colors.grey,
  );

  const AutoCompleteWidget(
      {required this.controller,
      required this.focusNode,
      this.hintText = '',
      this.prefixIcon,
      this.suffixIcon,
      this.maxLength,
      this.maxLines = 1,
      this.minLines = 1,
      this.textInputType,
      this.textInputAction,
      this.colorBackground,
      this.colorBorder,
      this.border,
      this.elevation = 4.0,
      this.radius = 9999.0,
      this.onChanged,
      this.onSaved,
      this.contentPadding,
      this.hintStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    const styles = TextStyle(fontSize: 15.0);

    return Flexible(
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: colorBackground,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            maxLength: maxLength,
            minLines: minLines,
            maxLines: maxLines,
            onChanged: onChanged,
            onSubmitted: onSaved,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle ?? styles.copyWith(color: Colors.grey),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 14.0),
              focusedBorder: border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(
                        color: colorBorder ?? Colors.grey,
                        style: BorderStyle.none),
                  ),
              enabledBorder: border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(
                        color: colorBorder ?? Colors.grey,
                        style: BorderStyle.none),
                  ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      ),
    );
  }
}
