import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_irrigation/modules/farm/views/farm_page.dart';
import 'package:smart_irrigation/modules/home/views/widgets/home_widget.dart';
import 'package:smart_irrigation/modules/notification/views/notification_page.dart';
import 'package:smart_irrigation/utilities/asset_path_util.dart';
import 'package:smart_irrigation/utilities/custom_navigator.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/app_colors.dart';
import 'package:smart_irrigation/utilities/ui_utilities/text_style_util.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../farm/domains/providers/farm_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = YoutubePlayerController(
    initialVideoId: 'HqffCwgE9u0',
    flags: const YoutubePlayerFlags(
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final farmController = ref.watch(farmProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const YMargin(20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning!",
                            style: semiBoldStyle(16, AppColors.brandBlack),
                          ),
                          const YMargin(5),
                          Text(
                            "Tuesday, 15 November",
                            style: normalStyle(13, AppColors.brandBlack),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        CustomNavigator.route(context, NotificationPage.routeName);
                      },
                      child: Material(
                        color: AppColors.transparent,
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.greyF6,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(SvgAssetPath.notification),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const YMargin(20),
              Container(
                height: 2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.greyF6,
                ),
              ),
              const YMargin(20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 204,
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.greyF6,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    ImageAssetPath.cloudysun,
                                    height: 80,
                                    width: 100,
                                  ),
                                  Text(
                                    "+${farmController.index + 10 * 3}°C",
                                    style: boldStyle(48, AppColors.brandBlack),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  HomeIcons(
                                    iconPath: SvgAssetPath.temp,
                                    title: "+2${farmController.index} C",
                                    subTitle: "Soil temp",
                                  ),
                                  HomeIcons(
                                    iconPath: SvgAssetPath.humidity,
                                    title: "${farmController.index + 1}9%",
                                    subTitle: "Humidity",
                                  ),
                                  HomeIcons(
                                    iconPath: SvgAssetPath.precipitation,
                                    title: "${farmController.index} mm",
                                    subTitle: "Precipitation",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const YMargin(26),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "My Fields",
                                style: normalStyle(16, AppColors.brandBlack),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                CustomNavigator.route(context, FarmPage.routeName);
                              },
                              child: Text(
                                "See all",
                                style: normalStyle(16, AppColors.brandGreen),
                              ),
                            ),
                          ],
                        ),
                        const YMargin(20),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(
                                  farmController.farmValues.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      farmController.switchTo(index);
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            farmController.farmValues[index]["title"],
                                            style: normalStyle(
                                              16,
                                              farmController.index == index
                                                  ? AppColors.brandGreen
                                                  : AppColors.brandBlack,
                                            ),
                                          ),
                                          const YMargin(12),
                                          Container(
                                            height: 2,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: farmController.index == index
                                                  ? AppColors.brandGreen
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const YMargin(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 92,
                                  width: 160,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xffECFFF3),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: AppColors.brandGreen),
                                              ),
                                              padding: const EdgeInsets.all(9),
                                              child: SvgPicture.asset(
                                                SvgAssetPath.irrigation,
                                                height: 17,
                                                width: 14,
                                              ),
                                            ),
                                            const YMargin(4),
                                            Text(
                                              "Irrigation",
                                              style: normalStyle(16, AppColors.brandBlack),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CupertinoSwitch(
                                        value: farmController.farmValues[farmController.index]
                                            ['irrigate'],
                                        onChanged: (_) {
                                          farmController.switchIrrigation(_);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 92,
                                  width: 160,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xffECFFF3),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: 32,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(color: AppColors.brandGreen),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.camera,
                                                    size: 16,
                                                    color: AppColors.brandGreen.withOpacity(0.80),
                                                  ),
                                                )),
                                            const YMargin(4),
                                            Text(
                                              "Camera",
                                              style: normalStyle(16, AppColors.brandBlack),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CupertinoSwitch(
                                        value: farmController.farmValues[farmController.index]
                                            ['camera'],
                                        onChanged: (_) {
                                          farmController.switchIrrigation(_);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const YMargin(30),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

    // ClipRRect(
    //                       borderRadius: BorderRadius.circular(12),
    //                       child: SizedBox(
    //                         height: 200,
    //                         width: double.maxFinite,
    //                         child: YoutubePlayer(
    //                           controller: _controller,
    //                           showVideoProgressIndicator: true,
    //                         ),
    //                       ),
    //                     ),