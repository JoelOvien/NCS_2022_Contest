import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_irrigation/modules/dashboard/views/dashboard_page.dart';
import 'package:smart_irrigation/modules/field_view/views/field_view.dart';
import 'package:smart_irrigation/modules/home/views/home_screen.dart';
import 'package:smart_irrigation/modules/settings/views/settings.dart';

import '../../../../utilities/app_constants.dart';
import '../../../../utilities/helpers.dart';
import '../../../../utilities/ui_utilities/app_colors.dart';
import '../../../../utilities/ui_utilities/text_style_util.dart';
import '../../domains/providers/nav_bar_provider.dart';

class NavBarWidget extends ConsumerStatefulWidget {
  static const String routeName = '/nav_bar';
  const NavBarWidget({super.key});

  @override
  ConsumerState<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends ConsumerState<NavBarWidget> {
  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const DashboardPage(),
    const FieldViewRouterPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final navBarController = ref.watch(navBarProvider);

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(navBarController.index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: List.generate(AppConstants.barItems.length, (index) {
          return BottomNavigationBarItem(
            icon: Helpers.callSvg(
              AppConstants.barItems[index]['imagePath'],
              color: navBarController.index == index ? AppColors.brandGreen : AppColors.brandBlue,
            ),
            label: AppConstants.barItems[index]['title'],
          );
        }),
        selectedLabelStyle: mediumStyle(14, AppColors.brandGreen),
        currentIndex: navBarController.index,
        selectedItemColor: AppColors.brandGreen,
        onTap: (index) {
          navBarController.switchTo(index);
        },
      ),
    );
  }
}
