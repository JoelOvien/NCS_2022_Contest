import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_irrigation/modules/nav_bar/views/widgets/nav_bar_widget.dart';
import 'package:smart_irrigation/utilities/asset_path_util.dart';
import 'package:smart_irrigation/utilities/custom_navigator.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/button.dart';

import '../../../utilities/margin_util.dart';
import '../../../utilities/ui_utilities/app_colors.dart';
import '../../../utilities/ui_utilities/text_style_util.dart';
import '../../../utilities/ui_utilities/widgets/custom_back_button.dart';
import '../../../utilities/ui_utilities/widgets/custom_textfield.dart';

class ProfileSetupPage extends StatefulWidget {
  static const routeName = '/profile_setup';
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final name = TextEditingController();
  final occupation = TextEditingController();
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    SvgAssetPath.profilePic,
                  ),
                ),
                const YMargin(16),
                Text(
                  "Fill your profile",
                  style: boldStyle(24, AppColors.brandBlack),
                ),
                const YMargin(16),
                CustomTextField(
                  controller: name,
                  hintText: "Name",
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Name cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                const YMargin(16),
                CustomTextField(
                  controller: occupation,
                  hintText: "Occupation",
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Occupation cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                const Spacer(),
                Button(
                  text: "Submit",
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      CustomNavigator.routeForEver(context, NavBarWidget.routeName);
                    }
                  },
                ),
                const YMargin(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
