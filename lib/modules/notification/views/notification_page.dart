import 'package:flutter/material.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/app_colors.dart';
import 'package:smart_irrigation/utilities/ui_utilities/text_style_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/custom_back_button.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = '/notification_page';
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> notifications = [
    "Scheduled spraying was not performed. You have 2 days of delay.",
    "Field fertilization required in 3 days.",
    "Irrigation scheduled in 2 hours.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ...List.generate(
              3,
              (index) => Column(
                children: [
                  const YMargin(5),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.greyF6,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: AppColors.brandGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}hr\nAgo",
                              textAlign: TextAlign.center,
                              style: semiBoldStyle(
                                14,
                                AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        const XMargin(15),
                        Expanded(
                          child: Text(
                            notifications[index],
                            style: normalStyle(14, AppColors.brandGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const YMargin(5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
