// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

const String APP_NAME = 'Kit Starter V3';

// ====================== Constants Project ======================

/// Header base 64
const String headerBase64 = 'data:image/jpeg;base64,';

/// Key encrypt
const String keyEncrypt = 'keyEncrypt'; // TODO: Key encrypt

// ====================== Shared Preferences ======================
const String shared_isLogin = 'sharedIsLogin';
const String shared_id = 'sharedIdCard';

// ==================================================================

const String _assetsImg = 'assets/images';
const String _assetsIc = 'assets/icons';

// ====================== IMAGES ======================

/// Logo and Icons APP
const String LOGO_BG = '$_assetsImg/bg.png';
const String LOGO = '$_assetsImg/icon.png';
const String LOGO_ICON2 = '$_assetsImg/icon2.png';
const String LOGO_TRANS2 = '$_assetsImg/icon2.png';

/// Logo Splash
const String LOGO_SPLASH = '$_assetsImg/splash.png';

/// avatar
const String LOGO_AVATAR = '$_assetsImg/ic_avatar.png';

/// avatar trans
const String LOGO_AVATAR2 = '$_assetsImg/ic_avatar2.png';

/// icon categories 2
const String iconCategories2 = '$_assetsImg/ic_categories.png';

/// icon banner def
const String iconBannerDef = '$_assetsImg/banner.png';

/// Images Onboarding
const String onboarding1 = '$_assetsImg/onboarding/1.png';
const String onboarding2 = '$_assetsImg/onboarding/2.png';
const String onboarding3 = '$_assetsImg/onboarding/3.png';
const String onboarding4 = '$_assetsImg/onboarding/4.png';
const String onboarding5 = '$_assetsImg/onboarding/5.png';
const String onboarding6 = '$_assetsImg/onboarding/6.png';
const String onboarding7 = '$_assetsImg/onboarding/7.png';

// ====================== ICONS ======================

/// icons default
const String iconDefault = '$_assetsIc/default.png';
const String icon360 = '$_assetsIc/ic_360.png';

/// icons menu
const String menu1 = '$_assetsIc/menu1.png';
const String menu2 = '$_assetsIc/menu2.png';
const String menu3 = '$_assetsIc/menu3.png';
const String menu4 = '$_assetsIc/menu4.png';
const String menu5 = '$_assetsIc/menu5.png';

// ====================== TEST ======================

/// url image generics by index
/// add `?sig=` plus a number
/// Example:
/// ```
/// var url = "$urlUnsplash?sig=99";
/// print(url); // output: https://source.unsplash.com/random?sig=99
/// ```
const String urlUnsplash = 'https://source.unsplash.com/random';

/// url image test
const String urlImageTest = '$urlUnsplash?sig=30';

String urlUnsplashId(int id) => '$urlUnsplash?sig=$id';

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
