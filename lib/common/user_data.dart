import 'package:meet_ava_take_home/common/pay_frequency.dart';

import 'employment_type.dart';

class UserData {
  final EmploymentType employmentType;
  final String employer;
  final String jobTitle;
  final int salary;
  final PayFrequency payFrequency;
  final bool isDirectDeposit;
  final String employerAddress;
  final DateTime nextPayDay;
  final int yearsWithEmployer;
  final int monthsWithEmployer;

  UserData({
    required this.employmentType,
    required this.employer,
    required this.jobTitle,
    required this.salary,
    required this.payFrequency,
    required this.isDirectDeposit,
    required this.employerAddress,
    required this.nextPayDay,
    required this.yearsWithEmployer,
    required this.monthsWithEmployer,
  });

  UserData copyWith({
    EmploymentType? employmentType,
    String? employer,
    String? jobTitle,
    int? salary,
    PayFrequency? payFrequency,
    bool? isDirectDeposit,
    String? employerAddress,
    DateTime? nextPayDay,
    int? yearsWithEmployer,
    int? monthsWithEmployer,
  }) {
    return UserData(
      employmentType: employmentType ?? this.employmentType,
      employer: employer ?? this.employer,
      jobTitle: jobTitle ?? this.jobTitle,
      salary: salary ?? this.salary,
      payFrequency: payFrequency ?? this.payFrequency,
      isDirectDeposit: isDirectDeposit ?? this.isDirectDeposit,
      employerAddress: employerAddress ?? this.employerAddress,
      nextPayDay: nextPayDay ?? this.nextPayDay,
      yearsWithEmployer: yearsWithEmployer ?? this.yearsWithEmployer,
      monthsWithEmployer: monthsWithEmployer ?? this.monthsWithEmployer,
    );
  }
}

abstract class EnumWrapper<T extends Enum> {
  const EnumWrapper();

  String getLabel(T value);

  List<T> get values;
}
