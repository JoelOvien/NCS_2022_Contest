import 'package:flutter/material.dart';
import 'package:smart_irrigation/animations/bottom_up_animations.dart';
import 'package:smart_irrigation/modules/authentication/views/sign_up.dart';
import 'package:smart_irrigation/utilities/custom_navigator.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/app_colors.dart';
import 'package:smart_irrigation/utilities/ui_utilities/text_style_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/button.dart';

import '../../authentication/views/sign_in.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = "/welcome_page";
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 482,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BottomUpAnimaitons(
                delay: 0.03,
                child: Column(
                  children: [
                    const YMargin(30),
                    Text(
                      "SaveMyFarm",
                      style: boldStyle(24, AppColors.brandBlack),
                    ),
                    const YMargin(8),
                    SizedBox(
                      width: 252,
                      child: Text(
                        "A completely wireless precision irrigation automation system.",
                        textAlign: TextAlign.center,
                        style: normalStyle(16, AppColors.brandBlack),
                      ),
                    ),
                    const Spacer(),
                    Button(
                      text: "Sign In",
                      backgroundColor: AppColors.greyF6,
                      textColor: AppColors.brandBlack,
                      function: () {
                        CustomNavigator.route(context, SignInPage.routeName);
                      },
                    ),
                    YMargin(screenHeight(context, percent: 0.01)),
                    Button(
                      text: "Sign Up",
                      function: () {
                        CustomNavigator.route(context, SignUpPage.routeName);
                      },
                    ),
                    YMargin(screenHeight(context, percent: 0.05)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
