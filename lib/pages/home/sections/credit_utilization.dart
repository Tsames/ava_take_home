import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/rating_thresholds.dart';

import '../../../common/ratings.dart';
import '../animated/animated_dial.dart';

class CreditUtilization extends StatelessWidget {
  final int totalBalance;
  final int totalLimit;

  const CreditUtilization({super.key, this.totalBalance = 8390, this.totalLimit = 200900});

  static const ratingThresholds = RatingThresholds(
    poor: 0.09,
    unsatisfactory: 0.29,
    fair: 0.49,
    good: 0.74,
    excellent: 1,
  );

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

  Rating _getRating(double percentage) {
    // The rating thresholds are reversed since low utilization is good
    if (percentage <= ratingThresholds.poor) return Rating.excellent;
    if (percentage <= ratingThresholds.unsatisfactory) return Rating.good;
    if (percentage <= ratingThresholds.fair) return Rating.fair;
    if (percentage <= ratingThresholds.good) return Rating.unsatisfactory;
    return Rating.poor;
  }

  @override
  Widget build(BuildContext context) {
    final cardHeaderText = Theme.of(context).textTheme.headlineSmall;
    final cardText = Theme.of(context).textTheme.bodyMedium;
    final greenText = Theme.of(context).colorScheme.tertiary;

    final rating = _getRating(totalBalance / totalLimit);

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
                thresholds: ratingThresholds,
                reversed: true,
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
