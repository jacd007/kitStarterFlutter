import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils_styles.dart';

get onValidatorDefault =>
    (value) => (value?.isEmpty ?? true) ? 'Required' : null;

class EditTextWidget extends StatefulWidget {
  final Color? colorBackground;
  final Color? colorBorder;
  final InputBorder? border;
  final TextEditingController? controller;
  final String title;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? contentTitlePadding;
  final BoxConstraints? suffixIconConstraints;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final TextStyle? textStyle;
  final bool? enabled;
  final bool titleIsHint;
  final bool hideCounterText;
  final TextAlign textAlign;
  final bool obscureText;
  final String? Function(String?)? onValidator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin;

  const EditTextWidget(
      {this.controller,
      this.hintText = '',
      this.title = '',
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
      this.onChanged,
      this.onSaved,
      this.contentPadding,
      this.contentTitlePadding,
      this.hintStyle,
      this.titleStyle,
      this.textStyle,
      this.enabled,
      this.titleIsHint = true,
      this.suffixIconConstraints,
      this.textAlign = TextAlign.start,
      this.obscureText = false,
      this.hideCounterText = false,
      this.onValidator,
      this.inputFormatters,
      this.margin,
      super.key});

  @override
  State<EditTextWidget> createState() => _EditTextWidgetState();
}

class _EditTextWidgetState extends State<EditTextWidget> {
  final UniqueKey key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ttt = widget.titleIsHint ? widget.hintText : widget.title;
    return Container(
      margin: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: ttt.isNotEmpty,
            child: Padding(
              padding: widget.contentTitlePadding ??
                  const EdgeInsets.only(right: 8, top: 8),
              child: Text(
                ttt,
                style: widget.titleStyle ?? styleTitlesCard,
              ),
            ),
          ),
          TextFormField(
            key: widget.key ?? key,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            maxLength: widget.maxLength,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            enabled: widget.enabled,
            style: widget.textStyle,
            textAlign: widget.textAlign,
            obscureText: widget.obscureText,
            validator: widget.onValidator,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              hintText: widget.hintText,
              counterText: widget.hideCounterText ? "" : null,
              isDense: true,
              hintStyle: widget.hintStyle ?? style.copyWith(color: Colors.grey),
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(vertical: 2.5),
              suffixIconConstraints: widget.suffixIconConstraints ??
                  const BoxConstraints(maxHeight: 14),
              focusedBorder: widget.border,
              enabledBorder: widget.border,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
