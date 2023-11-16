import 'package:flutter/material.dart';

// ...

const Color primaryColor = Color(0xFFe10e30);
const Color primaryColor2 = Color(0xFF73BC3B);
const Color primaryColor3 = Color(0xFFF6AE04);
const Color primaryColor4 = Color(0xFF1052D8);
const Color scaffoldBackgroundColorLight = Color.fromARGB(255, 247, 247, 247);
const Color scaffoldBackgroundColor = Color.fromARGB(255, 24, 24, 24);
const Color appBarColor = Color.fromARGB(255, 245, 245, 245);
const Color cardColorDark = Color(0xFF343434);
const Color cardColorDark2 = Color(0xFF31313A);

const Color buttonColor = Color(0xFFe10e30);
const Color buttonColor2 = Color(0xFF73BC3B);
const Color buttonColor3 = Color(0xFFF6AE04);
const Color buttonColor4 = Color(0xFF1052D8);
const defaultColor = Colors.white;

// ...

const Color white = Colors.white;
const Color black = Colors.black;
const Color black54 = Colors.black54;
const Color transparent = Colors.transparent;
const Color green = Colors.green;
const Color red = Colors.red;
const Color orange = Colors.orange;
const Color yellow = Colors.yellow;
const Color blue = Colors.blue;
const Color blueGrey = Colors.blueGrey;
const Color blueAccent = Colors.blueAccent;
const Color grey = Colors.grey;
final Color grey100 = Colors.grey.shade100;
final Color grey600 = Colors.grey.shade600;
final Color grey700 = Colors.grey.shade700;
final Color grey800 = Colors.grey.shade800;
final Color grey900 = Colors.grey.shade900;

// ...

class CustomColors {
  BuildContext context;
  Color? dark;
  Color? light;
  CustomColors(this.context, {this.dark, this.light});

  CustomColors copyWith({
    BuildContext? context,
    Color? dark,
    Color? light,
  }) =>
      CustomColors(
        context ?? this.context,
        dark: dark ?? this.dark,
        light: light ?? this.light,
      );

  bool get isModeDark {
    Brightness currentBrightness = Theme.of(context).brightness;
    final isDark = currentBrightness == Brightness.dark;
    return isDark;
  }

  Color get colorThemeMode {
    Brightness currentBrightness = Theme.of(context).brightness;
    final isDark = currentBrightness == Brightness.dark;

    final c1 = dark ?? scaffoldBackgroundColor;
    final c2 = light ?? scaffoldBackgroundColorLight;

    final cs = isDark ? c1 : c2;
    return cs;
  }

  ///
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  ///
  static MaterialStateProperty<Color?> createMaterialStateProperty(
    Color color, {
    MaterialState materialState = MaterialState.selected,
    int withAlpha = 128,
  }) {
    late MaterialStateProperty<Color?> materialStateProperty;

    final ccc = color.withAlpha(withAlpha);

    switch (materialState) {
      case MaterialState.selected:
        materialStateProperty = MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected) ? ccc : null);

        break;
      case MaterialState.pressed:
        materialStateProperty = MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.pressed) ? ccc : null);

        break;
      case MaterialState.focused:
        materialStateProperty = MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected) ? ccc : null);

        break;
      default:
        materialStateProperty = MaterialStateProperty.resolveWith((states) =>
            (states.contains(MaterialState.selected) ||
                    states.contains(MaterialState.pressed))
                ? ccc
                : null);
    }

    return materialStateProperty;
  }

// Themes

  /// theme dark
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        useMaterial3: true,
        primarySwatch: createMaterialColor(primaryColor),
        colorScheme: const ColorScheme.dark(primary: primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: appBarColor,
          foregroundColor: white,
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: buttonColor,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: buttonColor,
          disabledColor: Colors.grey,
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        cardTheme: const CardTheme(color: cardColorDark2),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(primaryColor),
          trackColor: createMaterialStateProperty(primaryColor),
          overlayColor: createMaterialStateProperty(primaryColor),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: createMaterialStateProperty(primaryColor),
          fillColor: createMaterialStateProperty(primaryColor),
        ),
      );

  /// theme light
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        useMaterial3: true,
        primarySwatch: createMaterialColor(primaryColor),
        colorScheme: const ColorScheme.light(primary: primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: white,
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: buttonColor,
          foregroundColor: white,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: buttonColor,
          disabledColor: Colors.grey,
        ),
        scaffoldBackgroundColor: white,
        cardTheme: const CardTheme(color: white),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(primaryColor),
          trackColor: createMaterialStateProperty(primaryColor),
          overlayColor: createMaterialStateProperty(primaryColor),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: createMaterialStateProperty(primaryColor),
          fillColor: createMaterialStateProperty(primaryColor),
        ),
      );
}

extension HexColor on Color {
  Color toColor(String code) {
    try {
      return Color(int.parse(code.substring(1), radix: 16) + 0xFF000000);
    } catch (_) {
      return primaryColor;
    }
  }

  String toHex() {
    try {
      return '#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
    } catch (_) {
      return '#FF9e9e9e';
    }
  }
}
