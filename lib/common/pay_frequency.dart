import 'package:meet_ava_take_home/common/user_data.dart';

enum PayFrequency {
  yearly('Yearly'),
  monthly('Monthly'),
  biWeekly('Bi-weekly'),
  hourly('Hourly'),
  notApplicable('Not applicable');

  final String label;

  const PayFrequency(this.label);
}

class PayFrequencyWrapper extends EnumWrapper<PayFrequency> {
  const PayFrequencyWrapper();

  @override
  String getLabel(PayFrequency value) => value.label;

  @override
  List<PayFrequency> get values => PayFrequency.values;
}
