import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_irrigation/utilities/asset_path_util.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';
import 'package:smart_irrigation/utilities/ui_utilities/app_colors.dart';
import 'package:smart_irrigation/utilities/ui_utilities/text_style_util.dart';

class FieldViewOffline extends StatefulWidget {
  static const String routeName = '/field_view_offline';
  const FieldViewOffline({super.key});

  @override
  State<FieldViewOffline> createState() => _FieldViewOfflineState();
}

class _FieldViewOfflineState extends State<FieldViewOffline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: SvgPicture.asset(SvgAssetPath.cameraOff),
            ),
          ),
          const YMargin(5),
          Text(
            "No camera online",
            style: normalStyle(16, AppColors.brandBlack),
          )
        ],
      ),
    );
  }
}
