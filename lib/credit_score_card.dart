import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/animated_dial.dart';

class CreditScoreCard extends StatelessWidget {
  const CreditScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = Theme.of(context).colorScheme.primaryContainer;
    final cardBorderColor = Theme.of(context).colorScheme.outline;
    final cardHeadline = Theme.of(context).textTheme.headlineSmall;
    final cardBodyLightText = Theme.of(context).textTheme.bodyMedium;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: cardBorderColor,
            width: 1.0,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Credit Score',
                      style: cardHeadline,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '+2pts',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Updated Today | Next May 12',
                  style: cardBodyLightText,
                ),
                const SizedBox(height: 4),
                Text(
                    'Experian',
                    style: cardBodyPinkText
                ),
              ],
            ),
          ),
          AnimatedDial(value: 720, maxValue: 850, numberText: "720", subText: "Good",),
        ],
      ),
    );
  }
}