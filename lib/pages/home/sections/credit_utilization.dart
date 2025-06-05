import 'package:flutter/material.dart';

import '../animated/animated_dial.dart';

class CreditUtilization extends StatelessWidget {
  final int totalBalance;
  final int totalLimit;

  const CreditUtilization({super.key, this.totalBalance = 8390, this.totalLimit = 200900});

  static Color excellent = Color(0xFF48A388);
  static Color good = Color(0xFF5CC368);
  static Color fair = Color(0xFFE6B652);
  static Color unsatisfactory = Color(0xFFF2C388);
  static Color poor = Color(0xFFF2A088);

  String _formatDollars(int amount) {
    final absAmount = amount.abs();
    final sign = amount < 0 ? '-' : '';

    if (absAmount < 1000) {
      return '$sign\$$absAmount';
    }

    final parts = absAmount.toString().split('').reversed.toList();
    final buffer = StringBuffer(sign + r'$');

    for (int i = parts.length - 1; i >= 0; i--) {
      buffer.write(parts[i]);
      if (i > 0 && i % 3 == 0) {
        buffer.write(',');
      }
    }

    return buffer.toString();
  }

  UtilizationRating _getUtilizationRating(double percentage) {
    if (percentage <= 0.09) return UtilizationRating('Excellent', excellent);
    if (percentage <= 0.29) return UtilizationRating('Good', good);
    if (percentage <= 0.49) return UtilizationRating('Fair', fair);
    if (percentage <= 0.74) return UtilizationRating('Unsatisfactory', unsatisfactory);
    return UtilizationRating('Poor', poor);
  }

  @override
  Widget build(BuildContext context) {
    final cardHeaderText = Theme.of(context).textTheme.headlineSmall;
    final cardText = Theme.of(context).textTheme.bodyMedium;
    final greenText = Theme.of(context).colorScheme.tertiary;

    final rating = _getUtilizationRating(totalBalance / totalLimit);

    String animatedDialCallBack(double animationValue) {
      return _getUtilizationRating(animationValue).label;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: cardHeaderText,
                      children: [
                        TextSpan(text: 'Total balance:'),
                        TextSpan(
                          text: " ${_formatDollars(totalBalance)}",
                          style: TextStyle(color: greenText),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Total limit: ${_formatDollars(totalLimit)}', style: cardText),
                ],
              ),
            ),
            SizedBox(
              height: 75,
              width: 75,
              child: AnimatedDial(
                value: ((totalBalance / totalLimit) * 100).toInt(),
                maxValue: 100,
                numberText: "%",
                textBuilder: animatedDialCallBack,
                colorTween: ColorTween(begin: excellent, end: poor),
              ),
            ),
          ],
        ),
        // Credit rating
        Text(
          rating.label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: rating.color),
        ),
        const SizedBox(height: 12),
        _buildUtilizationBar(),
        const SizedBox(height: 8),
        _buildUtilizationLabels(rating),
      ],
    );
  }

  Widget _buildUtilizationBar() {
    return Container(
      height: 25,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: excellent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
              ),
            ),
          ),
          Expanded(flex: 1, child: Container(color: fair)),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: poor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUtilizationLabels(UtilizationRating rating) {
    Color getLabelColor(String range) {
      return rating.label == range ? rating.color : const Color(0xFF736B7C);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('0-9%', style: TextStyle(fontSize: 12, color: getLabelColor('Excellent'))),
        Text('10-29%', style: TextStyle(fontSize: 12, color: getLabelColor('Good'))),
        Text('30-49%', style: TextStyle(fontSize: 12, color: getLabelColor('Fair'))),
        Text('50-74%', style: TextStyle(fontSize: 12, color: getLabelColor('Unsatisfactory'))),
        Text('<75%', style: TextStyle(fontSize: 12, color: getLabelColor('Poor'))),
      ],
    );
  }
}

class UtilizationRating {
  final String label;
  final Color color;

  UtilizationRating(this.label, this.color);
}
