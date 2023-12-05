import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../presentation.dart';

class SearchCustomAppBar extends StatelessWidget {
  final TextEditingController ctrSearch;
  final String? hint;
  final void Function(String) onChanged;

  final void Function()? onBack;
  final void Function()? onMenu;

  const SearchCustomAppBar(
      {required this.ctrSearch,
      required this.onChanged,
      this.hint,
      this.onBack,
      this.onMenu,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomColors(context);
    final theme2 = theme.copyWith(dark: white, light: black);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(children: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(4.0).copyWith(left: 0),
            child: Image.asset(
              Constants.LOGO_ICON2,
              width: 40,
              height: 40,
            ),
          ),
        ),
        AutoCompleteWidget(
          controller: ctrSearch,
          hintText: hint ?? Tk.searchCommerce.tr,
          focusNode: FocusNode(),
          suffixIcon: AutoCompleteWidget.suffixIconDefault,
          onChanged: (value) {
            final text = value.trim().toLowerCase();

            onChanged(text);
          },
        ),
        if (onMenu != null)
          FloatingActionButton(
            mini: true,
            elevation: 0,
            backgroundColor: theme.colorThemeMode,
            foregroundColor: theme2.colorThemeMode,
            onPressed: onMenu,
            child: const Icon(
              Icons.menu,
              size: 32.5,
            ),
          ),
      ]),
    );
  }
}
