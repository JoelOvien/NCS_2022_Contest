import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_irrigation/utilities/ui_utilities/widgets/custom_back_button.dart';

import '../../../utilities/asset_path_util.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/ui_utilities/app_colors.dart';
import '../../../utilities/ui_utilities/text_style_util.dart';
import '../domains/providers/farm_provider.dart';

class FarmPage extends ConsumerStatefulWidget {
  static const String routeName = '/farm';
  const FarmPage({super.key});

  @override
  ConsumerState<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends ConsumerState<FarmPage> {
  @override
  Widget build(BuildContext context) {
    final farmController = ref.watch(farmProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text("My Fields"),
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
                        value: farmController.farmValues[farmController.index]['irrigate'],
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
                              ),
                            ),
                            const YMargin(4),
                            Text(
                              "Camera",
                              style: normalStyle(16, AppColors.brandBlack),
                            ),
                          ],
                        ),
                      ),
                      CupertinoSwitch(
                        value: farmController.farmValues[farmController.index]['camera'],
                        onChanged: (_) {
                          farmController.switchCamera(_);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
