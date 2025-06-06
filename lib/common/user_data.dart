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
}

enum EmploymentType {
  fullTime('Full Time'),
  partTime('Part Time'),
  contract('Independent Contractor'),
  notApplicable('Not Applicable');

  final String label;

  const EmploymentType(this.label);
}

enum PayFrequency {
  yearly('Yearly'),
  monthly('Monthly'),
  biWeekly('Bi-weekly'),
  hourly('Hourly');

  final String label;

  const PayFrequency(this.label);
}
