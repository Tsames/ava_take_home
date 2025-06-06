import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/rating_thresholds.dart';
import 'package:meet_ava_take_home/common/repository/state_provider.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';
import 'package:meet_ava_take_home/pages/home/home_page_styled_card.dart';

import '../../../common/styles/app_colors.dart';
import '../animated/animated_dial.dart';

class CreditDetails extends ConsumerWidget {
  const CreditDetails({super.key});

  static const ratingThresholds = RatingThresholds(poor: 0.2, unsatisfactory: 0.4, fair: 0.6, good: 0.8, excellent: 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditScore = ref.watch(creditScoreProvider);
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 8),
      decoration: BoxDecoration(
        color: AppColors.headBackground,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
      ),
      child: StyledCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Credit Score', style: AppTextStyles.cardHeadlineStyle),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.middleGreen,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text('+2pts', style: AppTextStyles.cardPointsStyle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('Updated Today | Next May 12', style: AppTextStyles.cardBodyDetailsStyle),
                  const SizedBox(height: 4),
                  Text(
                    'Experian',
                    style: AppTextStyles.cardSmallBodyStyle.copyWith(
                      color: AppColors.pink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 75,
              height: 75,
              child: AnimatedDial(value: creditScore, maxValue: 850, thresholds: ratingThresholds),
            ),
          ],
        ),
      ),
    );
  }
}
