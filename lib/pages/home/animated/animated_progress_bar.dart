import 'package:flutter/material.dart';

import '../../../common/styles/app_colors.dart';

class AnimatedProgressBar extends StatefulWidget {
  final int balance;
  final int limit;
  final Duration duration;

  const AnimatedProgressBar({
    super.key,
    required this.balance,
    required this.limit,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    final initialValue = widget.balance / widget.limit;
    _animation = Tween<double>(
      begin: 0,
      end: initialValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.balance != oldWidget.balance) {
      final oldValue = oldWidget.balance / oldWidget.limit;
      final newValue = widget.balance / widget.limit;
      _animation = Tween<double>(
        begin: oldValue,
        end: newValue,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                // Progress bar background (static)
                Positioned(
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(color: AppColors.outline, borderRadius: BorderRadius.circular(4)),
                  ),
                ),

                // Progress bar
                Positioned(
                  left: 0,
                  child: Container(
                    width: width * _animation.value,
                    height: height,
                    decoration: BoxDecoration(color: AppColors.middleGreen, borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
