import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  Text("a"),
                  Text("b"),
                  Text("c"),
                  Text("d"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
