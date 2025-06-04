import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = Theme.of(context).colorScheme.primaryContainer;
    final cardBorderColor = Theme.of(context).colorScheme.outline;

    final headlineText = Theme.of(context).textTheme.headlineMedium;
    final cardBodyText = Theme.of(context).textTheme.headlineSmall;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account details', style: headlineText),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: cardBorderColor, width: 1.0),
          ),
          child: Column(
            children: [
              _buildUtilizationSlider(context, 0.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Spend limit: \$100',
                          style: cardBodyText?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: " Why is it different?",
                          style: cardBodyPinkText?.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$30', style: cardBodyText),
                      Text(
                        'Balance',
                        style: cardBodyText?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$600', style: cardBodyText),
                      Text(
                        'Credit limit',
                        style: cardBodyText?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(height: 32, color: cardBorderColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Utilization',
                    style: cardBodyText?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text('4%', style: cardBodyText),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUtilizationSlider(BuildContext context, double utilization) {
    final value = (utilization * 100).toInt();

    final progressBarBackground = Theme.of(
      context,
    ).colorScheme.tertiaryContainer;
    final progressBarTick = Theme.of(context).colorScheme.tertiary;
    final markerBackgroundColor = Theme.of(context).colorScheme.onPrimary;

    return Container(
      height: 60,
      child: Stack(
        children: [
          // Progress bar background
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: progressBarBackground,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),

          // Narrow progress tick
          Positioned(
            bottom: 14,
            left:
                MediaQuery.of(context).size.width * utilization -
                1.5, // Center the 3px wide tick
            child: Container(
              width: 3,
              height: 8,
              decoration: BoxDecoration(
                color: progressBarTick,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          ),

          // Marker with label
          Positioned(
            left: (MediaQuery.of(context).size.width * utilization) - 20,
            bottom: 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: markerBackgroundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '\$75',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),

                // Triangle pointer
                CustomPaint(
                  painter: TrianglePainter(),
                  size: const Size(12, 8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for triangle marker
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2A1E39)
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
