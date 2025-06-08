import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/repository/state_provider.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_date_input.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_dropdown_input.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_enum_dropdown_input.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_input_field.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_multiline-input.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_radio_button.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_text_input.dart';
import 'package:meet_ava_take_home/pages/settings/settings_button.dart';

import '../../../common/employment_type.dart';
import '../../../common/pay_frequency.dart';
import '../../../common/styles/app_colors.dart';
import '../../../common/styles/app_text_styles.dart';
import '../../../common/util/string_formater.dart';

class SettingsEdit extends ConsumerStatefulWidget {
  const SettingsEdit({super.key});

  @override
  ConsumerState<SettingsEdit> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsEdit> {
  @override
  Widget build(BuildContext context) {
    final format = StringFormater();
    final userData = ref.watch(userDataProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Edit employment information', style: AppTextStyles.settingsHeadlineStyle),
        const SizedBox(height: 30),
        SettingsInputField(
          fieldName: "Employment type",
          child: SettingsEnumDropdownInput<EmploymentType>(
            initialValue: userData.employmentType,
            enumWrapper: EmploymentTypeWrapper(),
            onChanged: (EmploymentType? newValue) {
              if (newValue != null) {
                ref.read(userDataProvider.notifier).state = userData.copyWith(employmentType: newValue);
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        SettingsInputField(
          fieldName: "Employer",
          child: SettingsTextInput(
            value: userData.employer,
            onChanged: (String newValue) {
              ref.read(userDataProvider.notifier).state = userData.copyWith(employer: newValue);
            },
          ),
        ),
        const SizedBox(height: 20),
        SettingsInputField(
          fieldName: "Job Title",
          child: SettingsTextInput(
            value: userData.jobTitle,
            onChanged: (String newValue) {
              ref.read(userDataProvider.notifier).state = userData.copyWith(jobTitle: newValue);
            },
          ),
        ),
        const SizedBox(height: 20),
        SettingsInputField(
          fieldName: "Gross annual income",
          child: SettingsTextInput(
            value: format.formatDollars(userData.salary),
            onChanged: (String newValue) {
              ref.read(userDataProvider.notifier).state = userData.copyWith(salary: 1);
            },
          ),
        ),
        const SizedBox(height: 20),
        SettingsInputField(
          fieldName: "Pay frequency",
          child: SettingsEnumDropdownInput<PayFrequency>(
            initialValue: userData.payFrequency,
            enumWrapper: PayFrequencyWrapper(),
            onChanged: (PayFrequency? newValue) {
              if (newValue != null) {
                ref.read(userDataProvider.notifier).state = userData.copyWith(payFrequency: newValue);
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        SettingsInputField(
          fieldName: "My next payday is",
          child: SettingsDateField(
            onDateSelected: (DateTime newValue) {
              ref.read(userDataProvider.notifier).state = userData.copyWith(nextPayDay: newValue);
            },
          ),
        ),
        const SizedBox(height: 20),
        SettingsInputField(
          fieldName: "Is your pay a direct deposit",
          child: SettingsRadioButton(
            initialValue: userData.isDirectDeposit,
            onChanged: (bool newValue) {
              ref.read(userDataProvider.notifier).state = userData.copyWith(isDirectDeposit: newValue);
            },
          ),
        ),
        const SizedBox(height: 20),
        SettingsInputField(
          fieldName: "Employer address",
          child: SettingsMultilineInput(
            initialValue: userData.employerAddress,
            onChanged: (String newValue) {
              ref.read(userDataProvider.notifier).state = userData.copyWith(employerAddress: newValue);
            },
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
                  initialValue: userData.yearsWithEmployer,
                  units: "year",
                  maxValue: 10,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      ref.read(userDataProvider.notifier).state = userData.copyWith(yearsWithEmployer: newValue);
                    }
                  },
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: SettingsDropdownInput(
                  initialValue: userData.monthsWithEmployer,
                  units: "month",
                  maxValue: 11,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      ref.read(userDataProvider.notifier).state = userData.copyWith(monthsWithEmployer: newValue);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        SettingsButton(
          textColor: AppColors.white,
          backgroundColor: AppColors.headBackground,
          buttonText: "Confirm",
          onPressedCallback: () => {},
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
