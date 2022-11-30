import 'package:flutter/material.dart';
import 'package:smart_irrigation/modules/authentication/views/profile_setup.dart';
import 'package:smart_irrigation/modules/authentication/views/sign_in.dart';
import 'package:smart_irrigation/modules/authentication/views/sign_up.dart';
import 'package:smart_irrigation/modules/dashboard/views/dashboard_page.dart';
import 'package:smart_irrigation/modules/farm/views/farm_page.dart';
import 'package:smart_irrigation/modules/field_view/views/field_view.dart';
import 'package:smart_irrigation/modules/field_view/views/field_view_offline.dart';
import 'package:smart_irrigation/modules/field_view/views/field_view_online.dart';
import 'package:smart_irrigation/modules/home/views/home_screen.dart';
import 'package:smart_irrigation/modules/nav_bar/views/widgets/nav_bar_widget.dart';
import 'package:smart_irrigation/modules/notification/views/notification_page.dart';
import 'package:smart_irrigation/modules/onboarding/views/welcome_page.dart';
import 'package:smart_irrigation/modules/profile/views/profile_page.dart';
import 'package:smart_irrigation/modules/settings/views/settings.dart';

import '../modules/onboarding/views/splash_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    // Onboarding
    SplashScreen.routeName: (context) => const SplashScreen(),
    WelcomePage.routeName: (context) => const WelcomePage(),

    // Home
    NavBarWidget.routeName: (context) => const NavBarWidget(),
    HomeScreen.routeName: (context) => const HomeScreen(),

    // Settings
    SettingsPage.routeName: (context) => const SettingsPage(),
    ProfilePage.routeName: (context) => const ProfilePage(),

    // authentication
    SignInPage.routeName: (context) => const SignInPage(),
    SignUpPage.routeName: (context) => const SignUpPage(),
    ProfileSetupPage.routeName: (context) => const ProfileSetupPage(),

    // farm
    FarmPage.routeName: (context) => const FarmPage(),

    // notification
    NotificationPage.routeName: (context) => const NotificationPage(),

    // dashboard
    DashboardPage.routeName: (context) => const DashboardPage(),

    // cameras
    FieldViewOffline.routeName: (context) => const FieldViewOffline(),
    FieldViewOnline.routeName: (context) => const FieldViewOnline(),
    FieldViewRouterPage.routeName: (context) => const FieldViewRouterPage(),
  };
}
