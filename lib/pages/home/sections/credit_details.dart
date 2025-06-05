import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/rating_thresholds.dart';
import 'package:meet_ava_take_home/repository/score_provider.dart';

import '../animated/animated_dial.dart';

class CreditDetails extends ConsumerWidget {
  const CreditDetails({super.key});

  static const ratingThresholds = RatingThresholds(poor: 0.2, unsatisfactory: 0.4, fair: 0.6, good: 0.8, excellent: 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardHeadline = Theme.of(context).textTheme.headlineSmall;
    final cardBodyLightText = Theme.of(context).textTheme.bodyMedium;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;

    final creditScore = ref.watch(creditScoreProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Credit Score', style: cardHeadline),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(12),
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
              Text('Updated Today | Next May 12', style: cardBodyLightText),
              const SizedBox(height: 4),
              Text('Experian', style: cardBodyPinkText),
            ],
          ),
        ),
        SizedBox(
          width: 75,
          height: 75,
          child: AnimatedDial(value: creditScore, maxValue: 850, thresholds: ratingThresholds),
        ),
      ],
    );
  }
}
