import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/score_provider.dart';

class FloatingHomeButton extends ConsumerWidget {
  const FloatingHomeButton({super.key});

  void _generateNewState(WidgetRef ref) {
    final random = Random();

    final newCreditScore = random.nextInt(850);
    ref.read(creditScoreProvider.notifier).state = newCreditScore;

    final newTotalBalance = random.nextInt(200000);
    ref.read(totalBalanceProvider.notifier).state = newTotalBalance;

    final newCreditBalance = random.nextInt(90);
    ref.read(creditBalanceProvider.notifier).state = newCreditBalance;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(onPressed: () => _generateNewState(ref), child: const Icon(Icons.refresh));
  }
}
