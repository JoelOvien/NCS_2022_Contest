import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../margin_util.dart';
import '../app_colors.dart';
import '../text_style_util.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  Widget? prefixIcon;
  String? hintText;
  double? height, width;
  List<String>? autofillHint;
  TextInputType? keyboardType;
  List<TextInputFormatter>? formatters = [];
  Widget? suffixIcon;
  String? Function(String?)? validator;
  Function(String s)? onChanged;
  bool? enabled;
  bool hide;
  int? maxLines;
  TextStyle? style;
  TextStyle? hintStyle;
  Color? color;
  String? title;

  CustomTextField({
    Key? key,
    this.height = 50,
    this.width,
    required this.controller,
    this.title,
    this.prefixIcon,
    this.hintText,
    this.autofillHint,
    this.hide = false,
    this.keyboardType,
    this.enabled = true,
    this.style,
    this.validator,
    this.formatters,
    this.onChanged,
    this.maxLines = 1,
    this.hintStyle,
    this.color,
    this.suffixIcon,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: mediumStyle(14, AppColors.purple1b),
            )
          else
            const SizedBox.shrink(),
          const YMargin(8),
          TextFormField(
            controller: controller,
            enabled: enabled,
            autofillHints: autofillHint,
            keyboardType: keyboardType,
            validator: validator,
            maxLines: maxLines,
            inputFormatters: formatters,
            onChanged: onChanged,
            obscureText: hide,
            style: style,
            decoration: InputDecoration(
              fillColor: AppColors.greyF6,
              filled: true,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: prefixIcon == null ? 20 : 8),
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: hintStyle ??
                  normalStyle(
                    14,
                    AppColors.purple1b.withOpacity(0.50),
                  ),
              prefixIcon: prefixIcon == null
                  ? null
                  : IntrinsicWidth(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          prefixIcon!,
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
