// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core.dart';

const fontBold = 'bold';
const fontLight = 'light';
const fontRegular = 'regular';

const TextStyle style = TextStyle(
  fontSize: 15.0,
  fontFamily: fontRegular,
);

const TextStyle styleH = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle styleMinH = TextStyle(
  fontSize: 11.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle style12H = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle style12 = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  fontFamily: fontRegular,
);
const TextStyle style13H = TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle style13 = TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.normal,
  fontFamily: fontRegular,
);
const TextStyle style14H = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle style14 = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontFamily: fontRegular,
);
const TextStyle styleMin = TextStyle(
  fontSize: 11.0,
  fontFamily: fontRegular,
);
const TextStyle styleTitlesCard = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle styleSubtitlesCard = TextStyle(
  fontFamily: fontBold,
);

const TextStyle styleTitles16 = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle styleTitles = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle styleTitles20 = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);
const TextStyle styleTitles22 = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);

const TextStyle styleTitles25 = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);

const TextStyle styleTitles30 = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);

const TextStyle styleTitles35 = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);

const TextStyle styleTitles40 = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);

const TextStyle styleTitles45 = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.bold,
  fontFamily: fontBold,
);

extension ListExtension on List {
  //
  int next(int current) {
    if ((current + 1) >= length) return 0;

    return current++;
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle styleSelected(bool value, {Color? selected, Color? unselected}) {
    return copyWith(color: value ? selected : unselected);
  }

  TextStyle forceColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle get forceWhiteColor {
    return copyWith(color: Colors.white);
  }

  TextStyle get forceBlackColor {
    return copyWith(color: Colors.black);
  }

  TextStyle get forceGreyColor {
    return copyWith(color: Colors.grey);
  }
}

RoundedRectangleBorder borderCard({
  BorderRadiusGeometry borderRadius = BorderRadius.zero,
  BorderSide side = BorderSide.none,
}) =>
    RoundedRectangleBorder(borderRadius: borderRadius, side: side);

extension StringExtension on String {
  /// capitalize string
  String capitalizes() {
    if (isEmpty) return '';
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  /// capitalize each word
  String capitalizeEachWord() {
    // ignore: unnecessary_this
    return this.split(' ').map((word) {
      if (word.isEmpty) {
        return '';
      }
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join(' ');
  }
}

/// `GestureUnfocus` extend to [Widget]
/// * `unfocusW` return [Widget]
extension GestureUnfocus on Widget {
  /// If a [Widget] `TextField` or `TextFormField` exists then the entire parent
  /// is wrapped to close the keyboard using only this extension.
  Widget get unfocusW {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: this,
    );
  }
}

/// [DateTime] on text format simple
/// FORMAT1 is `yyyy/MM/dd`
extension DateTimeExtension on DateTime {
  String toFormat1([String formate = 'dd/MM/yyyy']) {
    var format = DateFormat(formate, Tk.locale.tr);
    var dateResult = format.format(this);
    return dateResult;
  }
}

// decoraciones para tarjetas
class DecorationCustom {
  /// decoraciones para tarjetas
  static BoxDecoration decorationCard({Color? color, double radius = 20.0}) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      );

  /// decoraciones de TextFields
  static OutlineInputBorder decoEditText1(
      {double radius = 0.0, Color? colorBorder}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
          color: colorBorder ?? primaryColor, style: BorderStyle.none),
    );
  }
}
