// ignore_for_file: prefer_int_literals

import 'package:flutter/material.dart';
import 'package:smart_irrigation/animations/animations_double.dart';

import 'animations.dart';
import 'animations_double_range.dart';

class AnimateOnMount extends StatelessWidget {
  const AnimateOnMount({
    Key? key,
    required this.child,
    this.duration,
    this.displacementOnYAxis = 20,
    this.animationType = AnimationType.slideInAndFade,
    this.curve = Curves.linear,
  }) : super(key: key);
  final Widget child;
  final Duration? duration;
  final double displacementOnYAxis;
  final AnimationType animationType;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      curve: curve,
      duration: duration ?? const Duration(seconds: 1),
      builder: (context, value, child) {
        switch (animationType) {
          case AnimationType.slideInAndFade:
            return Transform.translate(
              offset: Offset(
                0,
                value.getNewRangeValue(
                  oldRange: DoubleRange(min: 0, max: 1),
                  newRange: DoubleRange(min: displacementOnYAxis, max: 0),
                ),
              ),
              child: Opacity(opacity: value, child: child),
            );

          case AnimationType.scale:
            return Transform.scale(
              scale: value.getNewRangeValue(
                newRange: DoubleRange(min: 0.7, max: 1.0),
                oldRange: DoubleRange(min: 0.0, max: 1.0),
              ),
              child: child,
            );
          // ignore: no_default_cases
          default:
            return child!;
        }
      },
      child: child,
    );
  }
}
