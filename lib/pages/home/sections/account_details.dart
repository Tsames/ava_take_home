import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/repository/state_provider.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/util/string_formater.dart';
import '../animated/animated_slider.dart';

class AccountDetails extends ConsumerWidget {
  final int creditLimit;

  const AccountDetails({super.key, this.creditLimit = 100});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = StringFormater();
    final creditBalance = ref.watch(creditBalanceProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 60,
          child: AnimatedUtilizationSlider(utilization: creditBalance, total: creditLimit),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Spend limit: ${format.formatDollars(creditLimit)}',
                    style: AppTextStyles.cardHeadlineLightStyle,
                  ),
                  TextSpan(
                    text: " Why is it different?",
                    style: TextStyle(color: AppColors.pink, fontWeight: FontWeight.w600),
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
                Text(format.formatDollars(creditBalance), style: AppTextStyles.cardHeadlineStyle),
                Text('Balance', style: AppTextStyles.cardHeadlineLightStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(format.formatDollars(creditLimit), style: AppTextStyles.cardHeadlineStyle),
                Text('Credit limit', style: AppTextStyles.cardHeadlineLightStyle),
              ],
            ),
          ],
        ),
        Divider(height: 32, color: AppColors.outline),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Utilization', style: AppTextStyles.cardHeadlineLightStyle),
            Text(format.formatPercent(creditBalance, creditLimit), style: AppTextStyles.cardHeadlineStyle),
          ],
        ),
      ],
    );
  }
}
