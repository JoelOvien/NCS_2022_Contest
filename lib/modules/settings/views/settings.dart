import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_irrigation/modules/profile/views/profile_page.dart';
import 'package:smart_irrigation/utilities/asset_path_util.dart';
import 'package:smart_irrigation/utilities/custom_navigator.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/app_colors.dart';
import 'package:smart_irrigation/utilities/ui_utilities/text_style_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/button.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings_page';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 270,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(ImageAssetPath.gradient),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const YMargin(6),
                  SvgPicture.asset(SvgAssetPath.profilePic),
                  const YMargin(8),
                  Text(
                    "Bankole Kofo",
                    style: normalStyle(16, AppColors.brandBlack),
                  ),
                  Text(
                    "Farm Manager",
                    style: normalStyle(16, AppColors.brandGrey),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(0, -50),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.greyF6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Planned Activities",
                          style: mediumStyle(14, AppColors.brandBlack),
                        ),
                        const YMargin(8),
                        Row(
                          children: const [
                            Icon(
                              Icons.check_box_outlined,
                              color: AppColors.brandGreen,
                            ),
                            XMargin(10),
                            Text("Check fruit for insect"),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.check_box_outlined,
                              color: AppColors.brandGreen,
                            ),
                            XMargin(10),
                            Text("Irrigate vegetable's field"),
                          ],
                        ),
                        const YMargin(16),
                        Button(
                          text: "+ Add Plan",
                          function: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "Others",
                  style: normalStyle(16, AppColors.brandBlack),
                ),
                const YMargin(12),
                GestureDetector(
                  onTap: () {
                    CustomNavigator.route(context, ProfilePage.routeName);
                  },
                  child: const ProfileItemWidget(
                    imagePath: SvgAssetPath.sProfile,
                    title: "Profile",
                    subtitle: "Name, location etc",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          buttonPadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          content: SizedBox(
                            width: screenWidth(context, percent: 0.9),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                YMargin(screenHeight(context, percent: 0.06)),
                                Text(
                                  "Smart Irrigation",
                                  textAlign: TextAlign.center,
                                  style: mediumStyle(16, AppColors.brandBlack),
                                ),
                                YMargin(screenHeight(context, percent: 0.02)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Select time to irrigate",
                                    textAlign: TextAlign.center,
                                    style: normalStyle(14, AppColors.brandBlack),
                                  ),
                                ),
                                YMargin(screenHeight(context, percent: 0.03)),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const ProfileItemWidget(
                    imagePath: SvgAssetPath.sIrrigation,
                    title: "Smart Scheduling",
                    subtitle: "Irrigation etc",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // CustomNavigator.routeForEver(context, SignInPage.routeName);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          buttonPadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          content: SizedBox(
                            width: screenWidth(context, percent: 0.9),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                YMargin(screenHeight(context, percent: 0.06)),
                                Text(
                                  "Log Out?",
                                  textAlign: TextAlign.center,
                                  style: mediumStyle(16, AppColors.brandBlack),
                                ),
                                YMargin(screenHeight(context, percent: 0.02)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Are you sure you want to log out of your account?",
                                    textAlign: TextAlign.center,
                                    style: normalStyle(14, AppColors.brandBlack),
                                  ),
                                ),
                                YMargin(screenHeight(context, percent: 0.03)),
                              ],
                            ),
                          ),
                          actions: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Button(
                                      height: 80,
                                      text: "Log Out",
                                      borderRadius: 0,
                                      width: screenWidth(context, percent: 0.28),
                                      function: () {},
                                    ),
                                  ),
                                  Expanded(
                                    child: Button(
                                      height: 80,
                                      text: "Cancel",
                                      backgroundColor: AppColors.white,
                                      textColor: AppColors.brandGreen,
                                      borderRadius: 0,
                                      function: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const ProfileItemWidget(
                    imagePath: SvgAssetPath.logout,
                    title: "Log Out",
                    subtitle: "logout",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const ProfileItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const YMargin(10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.greyF6,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SvgPicture.asset(imagePath),
              const XMargin(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: normalStyle(16, AppColors.brandBlack),
                    ),
                    Text(
                      subtitle,
                      style: normalStyle(12, AppColors.brandGrey),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: AppColors.brandGrey,
              ),
            ],
          ),
        ),
        const YMargin(10),
      ],
    );
  }
}
