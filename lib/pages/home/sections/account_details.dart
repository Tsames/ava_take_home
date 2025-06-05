import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/repository/score_provider.dart';

import '../../../common/util/Money.dart';
import '../animated/animated_slider.dart';

class AccountDetails extends ConsumerWidget {
  final int creditLimit;

  const AccountDetails({super.key, this.creditLimit = 100});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dividerColor = Theme.of(context).colorScheme.outline;
    final cardBodyText = Theme.of(context).textTheme.headlineSmall;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;

    final money = Money();

    final creditBalance = ref.watch(creditBalanceProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 60,
          child: AnimatedUtilizationSlider(utilization: creditBalance, total: creditLimit),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Spend limit: ${money.formatDollars(creditLimit)}',
                    style: cardBodyText?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: " Why is it different?", style: cardBodyPinkText?.copyWith(fontSize: 14)),
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
                Text(money.formatDollars(creditBalance), style: cardBodyText),
                Text('Balance', style: cardBodyText?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(money.formatDollars(creditLimit), style: cardBodyText),
                Text('Credit limit', style: cardBodyText?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
              ],
            ),
          ],
        ),
        Divider(height: 32, color: dividerColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Utilization', style: cardBodyText?.copyWith(fontWeight: FontWeight.w400)),
            Text(money.formatPercent(creditBalance, creditLimit), style: cardBodyText),
          ],
        ),
      ],
    );
  }
}
