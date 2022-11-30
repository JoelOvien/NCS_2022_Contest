// ignore_for_file: avoid_dynamic_calls

import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Helpers {
  static Widget callSvg(
    String path, {
    Color? color,
    double? height,
    double? width,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        path,
        color: color,
      ),
    );
  }

  static void closeKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context); // SHOULD BE builderContext
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static Future<void> copyToClipboard({
    required BuildContext context,
    String? copyValue,
    String? snackBarMessage,
  }) {
    return Clipboard.setData(ClipboardData(text: copyValue)).then((_) {
      // UI.showSnack(context, "Copied!");
    });
  }

  static void sendFeedback({int level = 1}) {
    level == 1
        ? HapticFeedback.lightImpact()
        : level == 2
            ? HapticFeedback.mediumImpact()
            : HapticFeedback.heavyImpact();
  }

  static void log(Object o) {
    if (kDebugMode) {
      print("``````````````\n $o \n\n``````````````");
    }
  }

  static void logc(Object o) {
    if (kDebugMode) {
      dev.log("$o");
    }
  }

  static String parseError(dynamic exception) {
    try {
      final List<String> errorTitles = exception.message.keys.toList();
      final error = errorTitles.map((e) => "${exception.message[e][0]}\n").toList().toString();
      return error.replaceAll(RegExp('[^A-Za-z  \n]'), '');
    } catch (e) {
      return exception.toString();
    }
  }
}
