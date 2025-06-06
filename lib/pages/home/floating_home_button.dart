import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/styles/app_colors.dart';
import '../../repository/state_provider.dart';

class FloatingHomeButton extends ConsumerWidget {
  const FloatingHomeButton({super.key});

  void _generateNewState(WidgetRef ref) {
    final random = Random();

    ref.read(creditScoreProvider.notifier).state = random.nextInt(850);
    ref.read(totalBalanceProvider.notifier).state = random.nextInt(200000);
    ref.read(creditBalanceProvider.notifier).state = random.nextInt(90);

    final currentAccounts = ref.read(creditAccountsProvider);
    final updatedAccounts = currentAccounts.map((account) {
      return account.copyWith(balance: random.nextInt(account.limit));
    }).toList();

    ref.read(creditAccountsProvider.notifier).state = updatedAccounts;

    ref.read(chartAnimationTriggerProvider.notifier).state = !ref.read(chartAnimationTriggerProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => _generateNewState(ref),
      backgroundColor: AppColors.headBackground,
      foregroundColor: AppColors.white,
      child: const Icon(Icons.refresh),
    );
  }
}
