import 'package:flutter/material.dart';

import 'animated_dial.dart';

class CreditUtilization extends StatelessWidget {
  final double totalBalance;
  final double totalLimit;
  final int creditScore;
  final String creditRating;
  final double utilizationPercentage;

  const CreditUtilization({
    super.key,
    this.totalBalance = 8390.0,
    this.totalLimit = 200900.0,
    this.creditScore = 48,
    this.creditRating = 'Excellent',
    this.utilizationPercentage = 0.48, // 48% utilization
  });

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = Theme.of(context).colorScheme.primaryContainer;
    final cardBorderColor = Theme.of(context).colorScheme.outline;

    final cardHeaderText = Theme.of(context).textTheme.headlineSmall;
    final cardText = Theme.of(context).textTheme.bodySmall;

    animatedDialCallBack(double animationValue) {
      if (animationValue < 0.25) return 'Excellent';
      if (animationValue < 0.5) return 'Good';
      if (animationValue < 0.75) return 'Fair';
      return 'Poor';
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with balance and circular progress
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
                            text: " \$8,390",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Total limit: \$200,900', style: cardText),
                  ],
                ),
              ),
              SizedBox(
                height: 75,
                width: 75,
                child: AnimatedDial(
                  value: 4,
                  maxValue: 100,
                  numberText: "%",
                  textBuilder: animatedDialCallBack,
                  colorTween: ColorTween(
                    begin: const Color(0xFF48A388),
                    end: const Color(0xFFFF7D60),
                  ),
                ),
              ),
            ],
          ),
          // Credit rating
          Text(
            creditRating,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF10B981),
            ),
          ),
          const SizedBox(height: 12),
          _buildUtilizationBar(),
          const SizedBox(height: 8),
          _buildUtilizationLabels(),
        ],
      ),
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
              decoration: const BoxDecoration(
                color: Color(0xFF48A388),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: Container(color: const Color(0xFFE6B652))),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF2A088),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUtilizationLabels() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('0-9%', style: TextStyle(fontSize: 12, color: Color(0xFF48A388))),
        Text(
          '10-29%',
          style: TextStyle(fontSize: 12, color: Color(0xFF736B7C)),
        ),
        Text(
          '30-49%',
          style: TextStyle(fontSize: 12, color: Color(0xFF736B7C)),
        ),
        Text(
          '50-74%',
          style: TextStyle(fontSize: 12, color: Color(0xFF736B7C)),
        ),
        Text('<75%', style: TextStyle(fontSize: 12, color: Color(0xFF736B7C))),
      ],
    );
  }

  String _formatCurrency(double amount) {
    if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(0)}K';
    }
    return amount.toStringAsFixed(0);
  }
}
