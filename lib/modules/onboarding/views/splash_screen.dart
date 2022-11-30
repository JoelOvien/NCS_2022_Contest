// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_irrigation/modules/onboarding/views/welcome_page.dart';
import 'package:smart_irrigation/utilities/ui_utilities/app_colors.dart';

import '../../../core/app/domains/app_provider.dart';
import '../../../utilities/custom_navigator.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = "/splash_screen";
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    final setup = ref.read(appProvider);

    await setup.initialise(context);
    await Future.delayed(const Duration(seconds: 1));
    if (setup.isLogged) {
      await setup.goHome(context);
    } else {
      CustomNavigator.routeForEver(context, WelcomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 5,
          width: 100,
          color: AppColors.greyE6,
        ),
      ),
    );
  }
}
