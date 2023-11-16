import 'package:flutter/material.dart';
import '../presentation/presentation.dart';
import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await NotificationApi.initialize;
  // await AwesomeNotification.initialize;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static String token = '';
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CustomColors customColors;

  @override
  void initState() {
    super.initState();
    // NotificationApi.init();

    /* AwesomeNotification.actionStream();
    NotificationApi.onNotifications.stream.listen((payload) {
      debugPrint('PAYLOAD: $payload');
      // navigatorKey.currentState?.pushNamed('/');
    }); */
  }

  @override
  Widget build(BuildContext context) {
    customColors = CustomColors(context);

    return GetMaterialApp(
      navigatorKey: MyApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: CustomColors.lightTheme,
      darkTheme: CustomColors.darkTheme,
      themeMode: ThemeMode.system,
      useInheritedMediaQuery: true,
      initialRoute: Routes.main,
      initialBinding: AuthBinding(),
      getPages: Pages.pages,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translations: Languages(),
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        // CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
