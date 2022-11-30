import 'package:flutter/material.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/app_colors.dart';
import 'package:smart_irrigation/utilities/ui_utilities/text_style_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/button.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/custom_back_button.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/custom_textfield.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile_page';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final email = TextEditingController();
  final name = TextEditingController();
  final occupation = TextEditingController();
  final location = TextEditingController();
  final fieldNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User's Info",
                style: normalStyle(14, AppColors.brandBlack),
              ),
              const YMargin(15),
              CustomTextField(
                controller: email,
                hintText: "Email",
              ),
              const YMargin(16),
              CustomTextField(
                controller: name,
                hintText: "Name",
              ),
              const YMargin(16),
              CustomTextField(
                controller: occupation,
                hintText: "Occupation",
              ),
              const YMargin(30),
              Text(
                "Farm's Info",
                style: normalStyle(14, AppColors.brandBlack),
              ),
              const YMargin(15),
              CustomTextField(
                controller: location,
                hintText: "Location",
              ),
              const YMargin(16),
              CustomTextField(
                controller: fieldNo,
                hintText: "Number of fields",
              ),
              const YMargin(16),
              CustomTextField(
                enabled: false,
                controller: TextEditingController(),
                hintText: "Configure a field",
                suffixIcon: const Icon(Icons.arrow_forward),
              ),
              const YMargin(40),
              Button(
                text: "Update",
                function: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
