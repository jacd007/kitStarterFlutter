// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

const String APP_NAME = 'Kit Starter V3';

/// ====================== Constants Project ======================
class Constants {
  /// Header base 64
  ///
  /// return data:image/jpeg;base64,
  static const String headerBase64 = 'data:image/jpeg;base64,';

  /// Key encrypt
  static const String keyEncrypt = 'keyEncrypt'; // TODO: Key encrypt

// ====================== Shared Preferences ======================
  static const String shared_isLogin = 'sharedIsLogin';
  static const String shared_JWT = 'sharedJWT';
  static const String shared_theme = 'sharedTheme';
  static const String shared_id = 'sharedIdCard';

// ==================================================================
  static const String _assetsImg = 'assets/images';
  static const String _assetsIc = 'assets/icons';

// ====================== IMAGES ======================

  /// Logo and Icons APP
  static const String LOGO_BG = '$_assetsImg/bg.png';
  static const String LOGO = '$_assetsImg/icon.png';
  static const String LOGO_ICON2 = '$_assetsImg/icon2.png';
  static const String LOGO_TRANS2 = '$_assetsImg/icon2.png';

  /// Logo Splash
  static const String LOGO_SPLASH = '$_assetsImg/splash.png';

  /// avatar
  static const String LOGO_AVATAR = '$_assetsImg/ic_avatar.png';

  /// avatar trans
  static const String LOGO_AVATAR2 = '$_assetsImg/ic_avatar2.png';

  /// icon categories 2
  static const String iconCategories2 = '$_assetsImg/ic_categories.png';

  /// icon banner def
  static const String iconBannerDef = '$_assetsImg/banner.png';

  /// Images Onboarding
  static const String onboarding1 = '$_assetsImg/onboarding/1.png';
  static const String onboarding2 = '$_assetsImg/onboarding/2.png';
  static const String onboarding3 = '$_assetsImg/onboarding/3.png';
  static const String onboarding4 = '$_assetsImg/onboarding/4.png';
  static const String onboarding5 = '$_assetsImg/onboarding/5.png';
  static const String onboarding6 = '$_assetsImg/onboarding/6.png';
  static const String onboarding7 = '$_assetsImg/onboarding/7.png';

// ====================== ICONS ======================

  /// icons default
  static const String iconDefault = '$_assetsIc/default.png';
  static const String icon360 = '$_assetsIc/ic_360.png';

  /// icons menu
  static const String menu1 = '$_assetsIc/menu1.png';
  static const String menu2 = '$_assetsIc/menu2.png';
  static const String menu3 = '$_assetsIc/menu3.png';
  static const String menu4 = '$_assetsIc/menu4.png';
  static const String menu5 = '$_assetsIc/menu5.png';

// ====================== TEST ======================

  /// url image generics by index
  /// add `?sig=` plus a number
  /// Example:
  /// ```
  /// var url = "$urlUnsplash?sig=99";
  /// print(url); // output: https://source.unsplash.com/random?sig=99
  /// ```
  static const String urlUnsplash = 'https://source.unsplash.com/random';

  /// url image test
  static const String urlImageTest = '$urlUnsplash?sig=30';

  static String urlUnsplashId(int id) => '$urlUnsplash?sig=$id';
}

// ==================================================================

///
/// [childAspectRatio] width / height
///
const aspectCard = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 180.0,
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  childAspectRatio: 0.695,
);

const crossAxisCount = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  childAspectRatio: 0.695,
);

const crossAxisSquareCount = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  childAspectRatio: 1 / 1,
);

const cross20AxisSquareCount = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  mainAxisSpacing: 12.0,
  crossAxisSpacing: 12.0,
  childAspectRatio: 0.85,
);

const aspectSquare = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200,
  childAspectRatio: 1.0,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
);

const aspectRectRectangle = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200.0,
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  childAspectRatio: 5 / 3,
);
