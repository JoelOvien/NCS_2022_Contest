import 'package:flutter/material.dart';

import '../../custom_navigator.dart';
import '../app_colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? callback;
  const CustomBackButton({
    super.key,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback ??
          () {
            CustomNavigator.pop(context);
          },
      child: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.purple1b,
        size: 18,
      ),
    );
  }
}
