import 'package:flutter/material.dart';
import 'package:smart_irrigation/utilities/margin_util.dart';

class FieldViewOnline extends StatefulWidget {
  static const String routeName = '/field_view_online';
  const FieldViewOnline({super.key});

  @override
  State<FieldViewOnline> createState() => _FieldViewOnlineState();
}

class _FieldViewOnlineState extends State<FieldViewOnline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/field.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
