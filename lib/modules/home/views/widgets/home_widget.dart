import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utilities/margin_util.dart';
import '../../../../utilities/ui_utilities/app_colors.dart';
import '../../../../utilities/ui_utilities/text_style_util.dart';

class HomeIcons extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subTitle;
  const HomeIcons({
    super.key,
    required this.iconPath,
    required this.subTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(iconPath),
        const YMargin(5),
        Text(
          title,
          style: normalStyle(12, AppColors.brandBlack),
        ),
        const YMargin(5),
        Text(
          subTitle,
          style: normalStyle(12, AppColors.brandGrey),
        ),
      ],
    );
  }
}
