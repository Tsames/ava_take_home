import 'package:flutter/material.dart';

class AnimatedDial extends StatefulWidget {
  final int value;
  final int maxValue;
  final String numberText;
  final String Function(double animationValue) textBuilder;
  final ColorTween colorTween;

  const AnimatedDial({
    super.key,
    required this.value,
    required this.maxValue,
    this.numberText = "",
    required this.textBuilder,
    required this.colorTween,
  });

  @override
  State<AnimatedDial> createState() => _AnimatedDialState();
}

class _AnimatedDialState extends State<AnimatedDial>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _tween;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final initialValue = widget.value / widget.maxValue;
    _tween = Tween<double>(begin: 0, end: initialValue);
    _animation = _tween.animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _colorAnimation = widget.colorTween.animate(_controller);

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onPrimary;

    final dialProgressColor = Theme.of(context).colorScheme.tertiary;
    final dialBackgroundColor = Theme.of(context).colorScheme.tertiaryContainer;

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;

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
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _colorAnimation.value ?? dialProgressColor,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "${(_animation.value * widget.maxValue).toInt()}${widget.numberText}",
                          style: TextStyle(
                            color: textColor,
                            fontSize: size * 0.33,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          widget.textBuilder(_animation.value),
                          style: TextStyle(
                            color: textColor,
                            fontSize: size * 0.1,
                            fontWeight: FontWeight.w600,
                          ),
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
