import 'package:flutter/material.dart';
import 'package:smart_irrigation/animations/animations_double.dart';

import 'animations.dart';
import 'animations_double_range.dart';

class AnimateInSequenceWithDuration extends StatefulWidget {
  final Flex child;
  final Duration animateNextAfter;
  final AnimationType animationType;
  final Duration? delay;
  final double displacementOnYAxis;
  const AnimateInSequenceWithDuration({
    Key? key,
    required this.child,
    this.animateNextAfter = const Duration(milliseconds: 400),
    this.animationType = AnimationType.scale,
    this.displacementOnYAxis = 20,
    this.delay,
  }) : super(key: key);

  @override
  State<AnimateInSequenceWithDuration> createState() => _AnimateInSequenceWithDurationState();
}

class _AnimateInSequenceWithDurationState extends State<AnimateInSequenceWithDuration>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    if (widget.child.children.isEmpty) {
      return;
    }
    _animationControllers = widget.child.children
        .map((_) => AnimationController(vsync: this, duration: widget.animateNextAfter))
        .toList();
    _animations = List.generate(widget.child.children.length, (index) {
      if (widget.animationType == AnimationType.scale) {
        return Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationControllers[index], curve: Curves.bounceOut),
        );
      }
      return Tween(begin: 0.0, end: 1.0).animate(_animationControllers[index]);
    });
    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        _animationControllers[0].forward();
      });
    } else {
      _animationControllers[0].forward();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < _animationControllers.length; i++) {
        _animationControllers[i].addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            if (i + 1 >= _animationControllers.length) return;
            _animationControllers[i + 1].forward();
          }
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant AnimateInSequenceWithDuration oldWidget) {
    if (oldWidget.child.children.length != widget.child.children.length) {
      init();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (final AnimationController controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.child.direction,
      mainAxisAlignment: widget.child.mainAxisAlignment,
      crossAxisAlignment: widget.child.crossAxisAlignment,
      children: [
        ...List.generate(widget.child.children.length, (index) {
          return AnimatedBuilder(
            animation: _animationControllers[index],
            builder: (context, child) {
              switch (widget.animationType) {
                case AnimationType.scale:
                  return Transform.scale(
                    scale: _animations[index].value.getNewRangeValue(
                          newRange: DoubleRange(min: 0.7, max: 1.0),
                          oldRange: DoubleRange(min: 0.0, max: 1.0),
                        ),
                    child: child,
                  );
                case AnimationType.slideInAndFade:
                  return Transform.translate(
                    offset: Offset(
                      0,
                      _animations[index].value.getNewRangeValue(
                            oldRange: DoubleRange(min: 0, max: 1),
                            newRange: DoubleRange(min: widget.displacementOnYAxis, max: 0),
                          ),
                    ),
                    child: Opacity(opacity: _animations[index].value, child: child),
                  );
                case AnimationType.opacity:
                  return Opacity(opacity: _animations[index].value, child: child);
              }
            },
            child: widget.child.children[index],
          );
        })
      ],
    );
  }
}
