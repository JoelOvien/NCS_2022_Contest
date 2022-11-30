import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../utilities/asset_path_util.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/ui_utilities/app_colors.dart';
import '../../../utilities/ui_utilities/text_style_util.dart';
import '../../farm/domains/providers/farm_provider.dart';

class DashboardPage extends ConsumerStatefulWidget {
  static const String routeName = '/dashboard_page';
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final pageController = PageController();
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
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  farmController.farmValues.length,
                  (index) => GestureDetector(
                    onTap: () {
                      farmController.switchTo(index);
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
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
                              color: farmController.index == index ? AppColors.brandGreen : null,
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
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...List.generate(
                    farmController.farmValues.length,
                    (index) => Column(
                      children: [
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
                                      farmController.switchCamera(_);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const YMargin(20),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.greyF6,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Details",
                                style: normalStyle(16, AppColors.brandBlack),
                              ),
                              const YMargin(8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Soil",
                                    style: normalStyle(16, AppColors.brandBlack),
                                  ),
                                  Text(
                                    farmController.farmValues[farmController.index]['Soil'],
                                    style: normalStyle(16, AppColors.brandGrey),
                                  ),
                                ],
                              ),
                              const YMargin(8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Crop",
                                    style: normalStyle(16, AppColors.brandBlack),
                                  ),
                                  Text(
                                    farmController.farmValues[farmController.index]['crop'],
                                    style: normalStyle(16, AppColors.brandGrey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const YMargin(15),
                        if (farmController.farmValues[farmController.index]['camera'])
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 200,
                              width: double.maxFinite,
                              child: YoutubePlayer(
                                controller: _controller,
                                showVideoProgressIndicator: true,
                              ),
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
