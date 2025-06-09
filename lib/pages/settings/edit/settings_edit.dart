import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/repository/state_provider.dart';
import 'package:meet_ava_take_home/pages/settings/edit/form/fields/settings_date_input.dart';
import 'package:meet_ava_take_home/pages/settings/edit/form/fields/settings_dropdown_input.dart';
import 'package:meet_ava_take_home/pages/settings/edit/form/fields/settings_enum_dropdown_input.dart';
import 'package:meet_ava_take_home/pages/settings/edit/form/fields/settings_radio_button.dart';
import 'package:meet_ava_take_home/pages/settings/edit/form/fields/settings_text_input.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_input_field.dart';
import 'package:meet_ava_take_home/pages/settings/settings_button.dart';

import '../../../common/employment_type.dart';
import '../../../common/pay_frequency.dart';
import '../../../common/styles/app_colors.dart';
import '../../../common/styles/app_text_styles.dart';
import '../../../common/user_data.dart';
import '../../../common/util/string_formater.dart';

class SettingsEdit extends ConsumerStatefulWidget {
  const SettingsEdit({super.key, required this.onExit});

  final VoidCallback onExit;

  @override
  ConsumerState<SettingsEdit> createState() => _SettingsEditState();
}

class _SettingsEditState extends ConsumerState<SettingsEdit> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;
  late UserData _formUserData;

  @override
  void initState() {
    super.initState();
    _formUserData = ref.read(userDataProvider) ?? UserData.empty();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _validateForm();
    });
  }

  void _validateForm() {
    final validity = _formKey.currentState?.validate() ?? false;
    setState(() {
      _isFormValid = validity;
    });
  }

  void _saveAndExit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      ref.read(userDataProvider.notifier).updateUserData(_formUserData);
      widget.onExit();
    }
  }

  @override
  Widget build(BuildContext context) {
    final format = StringFormater();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Edit employment information', style: AppTextStyles.settingsHeadlineStyle),
          const SizedBox(height: 30),
          SettingsInputField(
            fieldName: "Employment type",
            child: SettingsEnumDropdownInput<EmploymentType>(
              initialValue: _formUserData.employmentType,
              enumWrapper: EmploymentTypeWrapper(),
              onChanged: (EmploymentType? newValue) {
                _formUserData.employmentType = newValue;
                _validateForm();
              },
              validator: (v) => v == null ? 'Required' : null,
            ),
          ),
          const SizedBox(height: 20),
          SettingsInputField(
            fieldName: "Employer",
            child: SettingsTextInput(
              initialValue: _formUserData.employer,
              onChanged: (String newValue) {
                _formUserData.employer = newValue;
                _validateForm();
              },
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
          ),
          const SizedBox(height: 20),
          SettingsInputField(
            fieldName: "Job Title",
            child: SettingsTextInput(
              initialValue: _formUserData.jobTitle,
              onChanged: (String newValue) {
                _formUserData.jobTitle = newValue;
                _validateForm();
              },
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
          ),
          const SizedBox(height: 20),
          SettingsInputField(
            fieldName: "Gross annual income",
            child: SettingsTextInput(
              initialValue: _formUserData.salary != null ? format.formatDollars(_formUserData.salary!) : null,
              onChanged: (String newValue) {
                final parsed = int.tryParse(newValue.replaceAll(RegExp(r'[^0-9]'), ''));
                if (parsed != null) _formUserData.salary = parsed;
                _validateForm();
              },
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
          ),
          const SizedBox(height: 20),
          SettingsInputField(
            fieldName: "Pay frequency",
            child: SettingsEnumDropdownInput<PayFrequency>(
              initialValue: _formUserData.payFrequency,
              enumWrapper: PayFrequencyWrapper(),
              onChanged: (PayFrequency? newValue) {
                _formUserData.payFrequency = newValue;
                _validateForm();
              },
              validator: (v) => v == null ? 'Required' : null,
            ),
          ),
          const SizedBox(height: 20),
          SettingsInputField(
            fieldName: "My next payday is",
            child: SettingsDateField(
              initialDate: _formUserData.nextPayDay,
              onChanged: (DateTime? newValue) {
                _formUserData.nextPayDay = newValue;
                _validateForm();
              },
              validator: (v) => v == null
                  ? "Please select a date"
                  : v.isBefore(DateTime.now())
                  ? "Cannot enter a day in the past"
                  : null,
            ),
          ),
          const SizedBox(height: 20),
          SettingsInputField(
            fieldName: "Is your pay a direct deposit",
            child: SettingsRadioButton(
              initialValue: _formUserData.isDirectDeposit,
              onChanged: (bool newValue) {
                _formUserData.isDirectDeposit = newValue;
                _validateForm();
              },
            ),
          ),
          const SizedBox(height: 20),
          SettingsInputField(
            fieldName: "Employer address",
            child: SettingsTextInput(
              initialValue: _formUserData.employerAddress,
              minLines: 3,
              maxLines: 5,
              onChanged: (String newValue) {
                _formUserData.employerAddress = newValue;
                _validateForm();
              },
              validator: (v) => v!.isEmpty ? "Required" : null,
            ),
          ),
          const SizedBox(height: 20),
          SettingsInputField(
            fieldName: "Time with employer",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SettingsDropdownInput(
                    initialValue: _formUserData.yearsWithEmployer,
                    units: "year",
                    maxValue: 10,
                    onChanged: (int? newValue) {
                      _formUserData.yearsWithEmployer = newValue;
                      _validateForm();
                    },
                    validator: (v) => v == null ? "Required" : null,
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: SettingsDropdownInput(
                    initialValue: _formUserData.monthsWithEmployer,
                    units: "month",
                    maxValue: 11,
                    onChanged: (int? newValue) {
                      _formUserData.monthsWithEmployer = newValue;
                      _validateForm();
                    },
                    validator: (v) => v == null ? "Required" : null,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SettingsButton(
            textColor: AppColors.white,
            backgroundColor: _isFormValid ? AppColors.headBackground : AppColors.outline,
            buttonText: "Confirm",
            onPressedCallback: _saveAndExit,
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
