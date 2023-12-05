import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/core.dart';
import '../widgets/edit_text_widget.dart';

class CustomAppBar {
  static appBarSearch<T>(
      {TextEditingController? ctrSearch,
      String hintText = '',
      Color? backgroundColor,
      Color? cardColor,
      Widget? widgetAction,
      EdgeInsetsGeometry? padding,
      PreferredSizeWidget? bottom,
      double? toolbarHeight,
      double sizeIcon = 45.0,
      required List<T> listOrigin,
      required FocusNode focusedNode,
      void Function()? onBack,
      required void Function(List<T>, String) onSelectedData}) {
    const defPads = EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0);
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      bottom: bottom,
      toolbarHeight: toolbarHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: padding ?? defPads,
          child: Row(children: [
            GestureDetector(
              onTap: onBack,
              child: ClipOval(
                child: Image.asset(
                  Constants.LOGO_TRANS2,
                  width: sizeIcon,
                  height: sizeIcon,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Card(
                elevation: 1.5,
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99999.0),
                ),
                child: EditTextWidget(
                  hintText: hintText,
                  controller: ctrSearch,
                  border: DecorationCustom.decoEditText1(radius: 9999.0),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2.5),
                  onChanged: (value) {
                    onSelectedData(listOrigin, value.toLowerCase().trim());
                  },
                ),
              ),
            ),
            const SizedBox(width: 5),
            if (widgetAction != null) widgetAction,
            if (widgetAction != null) const SizedBox(width: 15),
          ]),
        ),
      ),
    );
  }

  ///
  static appBar({
    void Function()? onBack,
    Widget? title,
    List<Widget>? actions,
    Widget? flexibleSpace,
    Widget? icon,
    PreferredSizeWidget? bottom,
    double? elevation,
    bool? centerTitle,
    Color? backgroundColor,
    Color? colorIcon,
    bool hideLeading = false,
    bool hideAppBar = false,
  }) =>
      hideAppBar
          ? const SizedBox()
          : AppBar(
              leading: hideLeading
                  ? null
                  : IconButton(
                      onPressed: onBack ??
                          () {
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
                          },
                      icon: icon ??
                          Icon(
                            Icons.arrow_back_ios,
                            color: colorIcon,
                          ),
                    ),
              backgroundColor: backgroundColor,
              automaticallyImplyLeading: false,
              title: title,
              actions: actions,
              flexibleSpace: flexibleSpace,
              bottom: bottom,
              elevation: elevation,
              centerTitle: centerTitle,
            );
}
