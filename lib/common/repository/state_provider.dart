import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/employment_type.dart';
import 'package:meet_ava_take_home/common/pay_frequency.dart';
import 'package:meet_ava_take_home/common/repository/hive_storage_service.dart';
import 'package:meet_ava_take_home/common/user_data.dart';

import '../credit_account.dart';

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

final userDataProvider = StateNotifierProvider<UserDataNotifier, UserData?>((ref) {
  return UserDataNotifier();
});

class UserDataNotifier extends StateNotifier<UserData?> {
  UserDataNotifier() : super(null) {
    loadInitialUserData();
  }

  static final _defaultUserData = UserData(
    employmentType: EmploymentType.fullTime,
    employer: "Apple Inc",
    jobTitle: "Software Engineer",
    salary: 150000,
    payFrequency: PayFrequency.biWeekly,
    employerAddress: "Apple One Apple Park Way, Cupertino, CA 95014",
    yearsWithEmployer: 1,
    monthsWithEmployer: 3,
    nextPayDay: DateTime(2023, 9, 22),
    isDirectDeposit: true,
  );

  Future<void> loadInitialUserData() async {
    try {
      final storedData = await HiveStorageService.getUserData();

      if (storedData == null) {
        // Save defaults if no data exists
        await HiveStorageService.saveUserData(_defaultUserData);
        state = _defaultUserData;
      } else {
        state = storedData;
      }
    } catch (e, stackTrace) {
      debugPrint('Error loading user data: $e\n$stackTrace');
      state = _defaultUserData;
    }
  }

  Future<void> updateUserData(UserData newData) async {
    try {
      await HiveStorageService.saveUserData(newData);
      state = newData;
    } catch (e, stackTrace) {
      debugPrint('Error updating user data: $e\n$stackTrace');
    }
  }

  Future<void> clearUserData() async {
    await HiveStorageService.clear();
    state = null;
  }
}
