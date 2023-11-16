import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/themes/custom_colors.dart';
import '../controllers/all_controller.dart';

class BottomNavBarWidget extends StatelessWidget {
  final double iconSize;
  final void Function(int) onItemTapped;
  final List<String> icons;
  final List<String> titles;

  final int? currentIndex;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final bool tintLastWidget;
  final TextStyle? unselectedLabelStyle;
  final TextStyle? selectedLabelStyle;
  final bool isDesktop;
  final String textDesktop;
  final Widget? desktop;

  const BottomNavBarWidget({
    required this.onItemTapped,
    required this.icons,
    required this.titles,
    this.iconSize = 25.0,
    this.currentIndex,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.tintLastWidget = true,
    this.unselectedLabelStyle,
    this.selectedLabelStyle,
    this.isDesktop = false,
    this.desktop,
    this.textDesktop = '',
    super.key,
  });

  Color? _tintIcon(int selected, int index) {
    Color? color;

    // si es igual
    if (selected == index) color = selectedItemColor;
    // si no es igual
    if (selected != index) color = unselectedItemColor;
    // si es 4
    if (index == 4) return null;

    return color;
  }

  Widget _iconMenuHeader(bool show, AllController allctr) {
    const iconMenu = 'assets/icons/ic_menu.png';

    return /* !show
        ? MaterialButton(
            onPressed: () => allctr.showTextMenuDesktop.toggle(),
            child: _iconWidget(4, allctr, iconMenu),
          )
        : */
        ListTile(
      title: Text(textDesktop, style: selectedLabelStyle),
      leading: _iconWidget(4, allctr, iconMenu),
      onTap: () => allctr.showTextMenuDesktop.toggle(),
    );
  }

  Widget sssss(bool show, int index, AllController allctr) {
    final selected = allctr.selectedIndex.value;
    final ss = TextStyle(
      fontWeight: selected == index ? FontWeight.bold : null,
      color: _tintIcon(allctr.selectedIndex.value, index),
    );

    return /* !show
        ? MaterialButton(
            onPressed: () {},
            child: _iconWidget(index, allctr),
          )
        : */
        ListTile(
      title: !show ? null : Text(allctr.titles[index], style: ss),
      leading: _iconWidget(index, allctr),
      onTap: () => onItemTapped(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AllController allctr = Get.find();

    if (isDesktop) {
      return ObxValue((show) {
        return SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                desktop ?? _iconMenuHeader(show.value, allctr),
                for (int index = 0; index < icons.length; index++)
                  sssss(show.value, index, allctr),
              ]),
        );
      }, allctr.showTextMenuDesktop);
    }
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        for (int i = 0; i < icons.length; i++)
          BottomNavigationBarItem(
            label: titles[i],
            icon: _iconWidget(i, allctr),
          ),
      ],
      backgroundColor: appBarColor,
      currentIndex: currentIndex ?? allctr.selectedIndex.value,
      selectedItemColor: selectedItemColor ?? white,
      unselectedItemColor: unselectedItemColor ?? grey,
      unselectedLabelStyle: unselectedLabelStyle,
      selectedLabelStyle: selectedLabelStyle,
      onTap: onItemTapped,
    );
  }

  Widget _iconWidget(int i, AllController allctr, [String? asset]) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Image.asset(
        asset ?? icons[i],
        width: iconSize,
        height: iconSize,
        color: _tintIcon(allctr.selectedIndex.value, i),
      ),
    );
  }
}
