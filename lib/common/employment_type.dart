import 'package:meet_ava_take_home/common/user_data.dart';

enum EmploymentType {
  fullTime('Full Time'),
  partTime('Part Time'),
  contract('Independent Contractor'),
  notApplicable('Not Applicable');

  final String label;

  const EmploymentType(this.label);
}

class EmploymentTypeWrapper extends EnumWrapper<EmploymentType> {
  const EmploymentTypeWrapper();

  @override
  String getLabel(EmploymentType value) => value.label;

  @override
  List<EmploymentType> get values => EmploymentType.values;
}
