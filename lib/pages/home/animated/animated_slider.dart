import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/util/string_formater.dart';

import '../../../common/styles/app_colors.dart';

class AnimatedUtilizationSlider extends StatefulWidget {
  final int utilization;
  final int total;
  final Duration duration;

  const AnimatedUtilizationSlider({
    super.key,
    required this.utilization,
    required this.total,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<AnimatedUtilizationSlider> createState() => _AnimatedUtilizationSliderState();
}

class _AnimatedUtilizationSliderState extends State<AnimatedUtilizationSlider> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    final initialValue = widget.utilization / widget.total;
    _animation = Tween<double>(
      begin: 0,
      end: initialValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedUtilizationSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.utilization != oldWidget.utilization) {
      final oldValue = oldWidget.utilization / oldWidget.total;
      final newValue = widget.utilization / widget.total;
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
    final format = StringFormater();
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
                  left: 0,
                  right: 0,
                  bottom: height * 0.1,
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(color: AppColors.lightGreen, borderRadius: BorderRadius.circular(4)),
                  ),
                ),

                // Narrow progress tick (animated)
                Stack(
                  children: [
                    Positioned(
                      bottom: height * 0.1,
                      left: (width * _animation.value),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.deepPurple,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              format.formatDollars(widget.utilization),
                              style: const TextStyle(color: AppColors.white, fontSize: 12),
                            ),
                          ),
                          // Triangle pointer
                          CustomPaint(painter: TrianglePainter(), size: const Size(12, 8)),
                          SizedBox(height: height * 0.05),
                          Container(
                            width: 3,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.middleGreen,
                              borderRadius: BorderRadius.circular(1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.deepPurple
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height); // Bottom center
    path.lineTo(0, 0); // Top left
    path.lineTo(size.width, 0); // Top right
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
