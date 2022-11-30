import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../margin_util.dart';
import '../app_colors.dart';
import '../text_style_util.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
    this.icon,
    required this.text,
    Key? key,
    this.width,
    this.height = 50,
    this.borderWidth = 1,
    this.elevation,
    this.function,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.backgroundColor = AppColors.brandGreen,
    this.feedbackImpact = 1,
    this.withFeedback = true,
    this.loading = false,
    this.textStyle,
    this.iconPosition,
  }) : super(key: key);

  late String text;
  Widget? icon;
  double? width;
  double? height;
  double borderWidth;
  VoidCallback? function;
  Color? borderColor;
  Color? backgroundColor;
  TextStyle? textStyle;
  double? elevation;
  double? borderRadius;
  Color? textColor;
  int? feedbackImpact;
  bool withFeedback;
  bool loading;
  String? iconPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? screenWidth(context, percent: 0.89),
      child: TextButton(
        style: TextButton.styleFrom(
          disabledBackgroundColor: AppColors.greyE6,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          ),
          backgroundColor: function == null
              ? AppColors.greyE6
              : loading
                  ? AppColors.brandBlue
                  : backgroundColor,
          minimumSize: Size(width ?? 140, height ?? 60),
        ),
        onPressed: loading
            ? null
            : function == null
                ? null
                : () {
                    if (withFeedback) {
                      feedbackImpact == 1
                          ? HapticFeedback.lightImpact()
                          : feedbackImpact == 2
                              ? HapticFeedback.mediumImpact()
                              : HapticFeedback.heavyImpact();
                    }
                    if (function != null) {
                      function?.call();
                    }
                  },
        child: loading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) const XMargin(20),
                  if (iconPosition == "left") icon ?? const SizedBox(),
                  Expanded(
                    flex: icon != null ? 1 : 3,
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: textStyle ??
                            mediumStyle(
                              14,
                              function == null ? AppColors.purple1b : textColor ?? AppColors.white,
                            ),
                      ),
                    ),
                  ),
                  if (icon != null) const XMargin(10),
                  if (iconPosition == "right") icon ?? const SizedBox(),
                ],
              ),
      ),
    );
  }
}
