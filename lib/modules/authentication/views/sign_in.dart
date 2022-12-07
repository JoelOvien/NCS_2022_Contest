import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_irrigation/animations/slide_in_right.dart';
import 'package:smart_irrigation/modules/authentication/domains/providers/login_provider.dart';
import 'package:smart_irrigation/modules/authentication/views/sign_up.dart';
import 'package:smart_irrigation/utilities/custom_navigator.dart';
import 'package:smart_irrigation/utilities/extensions.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/button.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/custom_back_button.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/custom_textfield.dart';

import '../../../utilities/ui_utilities/app_colors.dart';
import '../../../utilities/ui_utilities/text_style_util.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/sign_in';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final email = TextEditingController();
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
                    "Welcome Back!",
                    style: boldStyle(24, AppColors.brandBlack),
                  ),
                  const YMargin(24),
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
                    controller: username,
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
                  Consumer(
                    builder: (context, ref, __) {
                      final signInController = ref.watch(loginProvider);
                      return Button(
                        text: "Sign In",
                        loading: signInController.loading,
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            signInController.login(
                              context,
                              username: username.text,
                              password: email.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: mediumStyle(14, AppColors.brandBlack),
                      ),
                      GestureDetector(
                        onTap: () {
                          CustomNavigator.route(context, SignUpPage.routeName);
                        },
                        child: Text(
                          "Sign Up",
                          style: mediumStyle(
                            14,
                            AppColors.brandGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const YMargin(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
