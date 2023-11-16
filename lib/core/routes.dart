import 'package:flutter/material.dart';
import '../presentation/presentation.dart';

class Routes {
  Routes._();

  static const String main = '/main';

  /// Auth
  static const String login = '/login';

  /// Home
  static const String homeMain = '/homeMain';

  // Home Screen

  static const String homeScreen = '/homeScreen';
  static const String home2Screen = '/home2Screen';
  static const String home3Screen = '/home3Screen';
  static const String home4Screen = '/home4Screen';
  static const String home5Screen = '/home5Screen';
}

class Pages {
  Pages._();

  static const _transition = Transition.downToUp;
  static const _transitionDuration = Duration(milliseconds: 400);
  static _routeGuard([bool protect = false]) => protect ? [RouteGuard()] : null;

  static final pages = [
    // main - splash
    GetPage(
      name: Routes.main,
      page: () => const SplashPage(),
      transition: _transition,
      transitionDuration: _transitionDuration,
      binding: AuthBinding(),
    ),
    // login
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      middlewares: _routeGuard(),
      transition: _transition,
      transitionDuration: _transitionDuration,
      binding: AuthBinding(),
    ),
    // home main
    GetPage(
      name: Routes.homeMain,
      page: () => const HomeMainPage(),
      middlewares: _routeGuard(),
      transition: _transition,
      transitionDuration: _transitionDuration,
      binding: HomeBinding(),
    ),
    // home screen - home
    GetPage(
      name: Routes.home2Screen,
      page: () => const HomeScreen(),
      transition: _transition,
      transitionDuration: _transitionDuration,
      binding: HomeBinding(),
    ),
    // home screen - home 2
    // home screen - home 3
    // home screen - home 4
    // home screen - settings
    GetPage(
      name: Routes.home5Screen,
      page: () => const SettingsScreen(),
      transition: _transition,
      transitionDuration: _transitionDuration,
      binding: HomeBinding(),
    ),
  ];
}

// User cannot go to the dashboard screen if he doesn’t have a login token.
class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    return authService.authed.value.isEmpty
        ? const RouteSettings(name: Routes.login)
        : null;
  }
}
