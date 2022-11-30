import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'bottom_up_animations.dart';

class FadeInAnimations extends StatelessWidget {
  const FadeInAnimations({Key? key, required this.delay, required this.child}) : super(key: key);
  final double delay;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..scene(begin: 0.milliseconds, duration: 500.milliseconds)
          .tween(AniProp.opacity, 0.0.tweenTo(1));

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      builder: (context, value, child) =>
          Opacity(opacity: value.get(AniProp.opacity), child: child),
      child: child,
    );
  }
}
