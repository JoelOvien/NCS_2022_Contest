import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class Shaker extends StatefulWidget {
  const Shaker({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<Shaker> createState() => ShakerState();
}

class ShakerState extends State<Shaker> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animation = Tween<double>(
      begin: 0,
      end: 120,
    ).animate(animationController);
  }

  math.Vector3 _shake() {
    final progress = animationController.value;
    final offset = sin(progress * pi * 10.0);
    return math.Vector3(offset * 25, 0, 0);
  }

  void shake() {
    animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Transform(
          transform: Matrix4.translation(_shake()),
          child: widget.child,
        );
      },
      animation: animation,
      child: widget.child,
    );
  }
}
