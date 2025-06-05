import 'package:flutter/material.dart';

import '../../../common/ratings.dart';
import '../animated/animated_dial.dart';

class CreditUtilization extends StatelessWidget {
  final int totalBalance;
  final int totalLimit;

  const CreditUtilization({super.key, this.totalBalance = 8390, this.totalLimit = 200900});

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

  Rating _getUtilizationRating(double percentage) {
    if (percentage <= 0.09) return Rating.excellent;
    if (percentage <= 0.29) return Rating.good;
    if (percentage <= 0.49) return Rating.fair;
    if (percentage <= 0.74) return Rating.unsatisfactory;
    return Rating.poor;
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
                colorTween: ColorTween(begin: rating.color, end: rating.color),
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
                color: Rating.excellent.color,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
              ),
            ),
          ),
          Expanded(flex: 1, child: Container(color: Rating.fair.color)),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Rating.poor.color,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUtilizationLabels(Rating rating) {
    Color getLabelColor(int ratingId) {
      return rating.numericValue == ratingId ? rating.color : const Color(0xFF736B7C);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('0-9%', style: TextStyle(fontSize: 12, color: getLabelColor(5))),
        Text('10-29%', style: TextStyle(fontSize: 12, color: getLabelColor(4))),
        Text('30-49%', style: TextStyle(fontSize: 12, color: getLabelColor(3))),
        Text('50-74%', style: TextStyle(fontSize: 12, color: getLabelColor(2))),
        Text('<75%', style: TextStyle(fontSize: 12, color: getLabelColor(1))),
      ],
    );
  }
}
