import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';
import 'package:meet_ava_take_home/pages/home/animated/animated_progress_bar.dart';

import '../../../common/credit_account.dart';
import '../../../common/repository/state_provider.dart';
import '../../../common/styles/app_colors.dart';
import '../../../common/util/string_formater.dart';

class CreditCardAccounts extends ConsumerWidget {
  const CreditCardAccounts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(creditAccountsProvider);
    final format = StringFormater();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (index, account) in accounts.indexed) ...[
          _buildAccountCard(account: account, format: format),
          const SizedBox(height: 12),
          if (index != accounts.length - 1) ...[
            const Divider(height: 12, color: AppColors.outline),
            const SizedBox(height: 12),
          ],
        ],
      ],
    );
  }

  Widget _buildAccountCard({required CreditAccount account, required StringFormater format}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(account.cardName, style: AppTextStyles.cardHeadlineStyle),
            Text(format.formatPercent(account.balance, account.limit), style: AppTextStyles.cardHeadlineStyle),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 10,
          child: AnimatedProgressBar(balance: account.balance, limit: account.limit),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(format.formatDollars(account.balance), style: AppTextStyles.cardHeadlineLightStyle),
                const SizedBox(width: 8),
                Text('Balance', style: AppTextStyles.cardHeadlineLightStyle),
              ],
            ),
            Row(
              children: [
                Text(format.formatDollars(account.limit), style: AppTextStyles.cardHeadlineLightStyle),
                const SizedBox(width: 8),
                Text('Limit', style: AppTextStyles.cardHeadlineLightStyle),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(account.reportedDate, style: AppTextStyles.cardBodyDetailsStyle),
      ],
    );
  }
}
