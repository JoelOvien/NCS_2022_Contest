import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'bottom_up_animations.dart';

class SlideInRightAnimation extends StatelessWidget {
  const SlideInRightAnimation({
    Key? key,
    required this.delay,
    required this.child,
    this.duration = 500,
  }) : super(key: key);
  final double delay;
  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..scene(begin: 0.milliseconds, duration: duration.milliseconds)
          .tween(AniProp.opacity, 0.0.tweenTo(1))
      ..scene(begin: 0.milliseconds, end: duration.milliseconds).tween(
        AniProp.translateX,
        (50.0).tweenTo(0),
        curve: Curves.easeOut,
      );

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (duration * delay).round()),
      duration: tween.duration,
      tween: tween,
      builder: (context, value, child) => Transform.translate(
        offset: Offset(value.get(AniProp.translateX), 0),
        child: Opacity(opacity: value.get(AniProp.opacity), child: child),
      ),
      child: child,
    );
  }
}
