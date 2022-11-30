import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_irrigation/utilities/app_router.dart';
import 'package:smart_irrigation/utilities/service_locator.dart';
import 'package:smart_irrigation/utilities/ui_utilities/theme.dart';

import 'modules/onboarding/views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Irrigation',
      routes: AppRouter.routes,
      theme: AppTheme.smTheme,
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey, // set property
    );
  }
}
