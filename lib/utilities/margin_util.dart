import 'package:flutter/material.dart';

class XMargin extends StatelessWidget {
  const XMargin(this.x, {Key? key}) : super(key: key);

  final double x;
  // ignore: use_key_in_widget_constructors
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YMargin extends StatelessWidget {
  const YMargin(this.y, {Key? key}) : super(key: key);

  final double y;
  // ignore: use_key_in_widget_constructors
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;

double height(BuildContext context) => MediaQuery.of(context).size.height;
double width(BuildContext context) => MediaQuery.of(context).size.width;
