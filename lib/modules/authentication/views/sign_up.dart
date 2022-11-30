import 'package:flutter/material.dart';
import 'package:smart_irrigation/animations/slide_in_right.dart';
import 'package:smart_irrigation/modules/authentication/views/profile_setup.dart';
import 'package:smart_irrigation/modules/authentication/views/sign_in.dart';
import 'package:smart_irrigation/utilities/custom_navigator.dart';
import 'package:smart_irrigation/utilities/extensions.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/button.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/custom_back_button.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/custom_textfield.dart';

import '../../../utilities/ui_utilities/app_colors.dart';
import '../../../utilities/ui_utilities/text_style_util.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign_up';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SlideInRightAnimation(
            delay: 0.3,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an account",
                    style: boldStyle(24, AppColors.brandBlack),
                  ),
                  const YMargin(24),
                  CustomTextField(
                    controller: username,
                    hintText: "Username",
                    prefixIcon: const Icon(Icons.person_outline),
                    validator: (s) {
                      if (s!.isEmpty) {
                        return "Username cannot be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const YMargin(16),
                  CustomTextField(
                    controller: email,
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.mail_outline),
                    validator: (s) {
                      if (!s!.isValidEmail()) {
                        return "Invalid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const YMargin(16),
                  CustomTextField(
                    controller: password,
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    validator: (s) {
                      if (s!.isEmpty) {
                        return "Password cannot be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const YMargin(26),
                  Button(
                    text: "Sign Up",
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        CustomNavigator.route(context, ProfileSetupPage.routeName);
                      }
                    },
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: mediumStyle(14, AppColors.brandBlack),
                      ),
                      GestureDetector(
                        onTap: () {
                          CustomNavigator.route(context, SignInPage.routeName);
                        },
                        child: Text(
                          "Sign In",
                          style: mediumStyle(
                            14,
                            AppColors.brandGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
