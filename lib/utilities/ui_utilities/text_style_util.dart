import 'package:flutter/material.dart';

TextStyle boldStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.bold,
    height: 1.2,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle semiBoldStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w600,
    height: 1.2,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle mediumStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? height,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w500,
    height: height ?? 1.2,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle normalStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.normal,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle extraLightStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w200,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle lightStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w300,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}
