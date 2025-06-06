import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/credit_account.dart';

final creditScoreProvider = StateProvider<int>((ref) => 720);
final totalBalanceProvider = StateProvider<int>((ref) => 8390);
final creditBalanceProvider = StateProvider<int>((ref) => 75);
final chartAnimationTriggerProvider = StateProvider<bool>((ref) => false);
final creditAccountsProvider = StateProvider<List<CreditAccount>>(
  (ref) => [
    CreditAccount(cardName: 'Syncb/Amazon', balance: 1500, limit: 6300, reportedDate: 'Reported on June 20, 2023'),
    CreditAccount(
      cardName: 'Citi/Costco Anywhere',
      balance: 1500,
      limit: 8000,
      reportedDate: 'Reported on June 20, 2023',
    ),
    CreditAccount(
      cardName: 'Chase/Southwest Rapid Rewards',
      balance: 1500,
      limit: 5000,
      reportedDate: 'Reported on June 20, 2023',
    ),
  ],
);
