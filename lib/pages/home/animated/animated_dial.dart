import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/rating_thresholds.dart';

import '../../../common/ratings.dart';

class AnimatedDial extends StatefulWidget {
  final int value;
  final int maxValue;
  final String numberText;
  final RatingThresholds thresholds;
  final bool reversed;

  const AnimatedDial({
    super.key,
    required this.value,
    required this.maxValue,
    this.numberText = "",
    required this.thresholds,
    this.reversed = false,
  });

  @override
  State<AnimatedDial> createState() => _AnimatedDialState();
}

class _AnimatedDialState extends State<AnimatedDial> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _tween;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    final initialValue = widget.value / widget.maxValue;
    _tween = Tween<double>(begin: 0, end: initialValue);
    _animation = _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedDial oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newProgress = widget.value / widget.maxValue;

    if (newProgress != _tween.end) {
      _tween
        ..begin = _animation.value
        ..end = newProgress;
      _controller
        ..reset()
        ..forward();
    }
  }

  Rating _getRating() {
    final percentage = (widget.value / widget.maxValue);
    final thresholds = widget.thresholds;

    if (percentage <= thresholds.poor) {
      return !widget.reversed ? Rating.poor : Rating.excellent;
    } else if (percentage <= thresholds.unsatisfactory) {
      return !widget.reversed ? Rating.unsatisfactory : Rating.good;
    } else if (percentage <= thresholds.fair) {
      return Rating.fair;
    } else if (percentage <= thresholds.good) {
      return !widget.reversed ? Rating.good : Rating.unsatisfactory;
    } else {
      return !widget.reversed ? Rating.excellent : Rating.poor;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onPrimary;
    final dialBackgroundColor = Theme.of(context).colorScheme.tertiaryContainer;

    final rating = _getRating();

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth < constraints.maxHeight ? constraints.maxWidth : constraints.maxHeight;

        return SizedBox(
          width: size,
          height: size,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox.expand(
                    child: CircularProgressIndicator(
                      value: _animation.value,
                      strokeWidth: size * 0.1,
                      backgroundColor: dialBackgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(rating.color),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "${(_animation.value * widget.maxValue).toInt()}${widget.numberText}",
                          style: TextStyle(color: textColor, fontSize: size * 0.28, fontWeight: FontWeight.w600),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          rating.label,
                          style: TextStyle(color: textColor, fontSize: size * 0.09, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
