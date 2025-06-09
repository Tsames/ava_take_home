import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/repository/state_provider.dart';
import 'package:meet_ava_take_home/pages/settings/display/settings_display_field.dart';
import 'package:meet_ava_take_home/pages/settings/settings_button.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/styles/app_text_styles.dart';
import '../../../common/user_data.dart';
import '../../../common/util/string_formater.dart';

class SettingsDisplay extends ConsumerWidget {
  final VoidCallback onEnter;

  const SettingsDisplay({super.key, required this.onEnter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = StringFormater();
    final userData = ref.watch(userDataProvider) ?? UserData.empty();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Confirm your employment', style: AppTextStyles.settingsHeadlineStyle),
        const Text(
          'Please review and confirm the below employment details are up-to-date.',
          style: AppTextStyles.settingsSubHeadlineStyle,
        ),
        const SizedBox(height: 30),
        SettingsDisplayField(
          fieldName: "Employment type",
          fieldData: userData.employmentType?.label ?? "No data available.",
        ),
        const SizedBox(height: 10),
        SettingsDisplayField(fieldName: "Employer", fieldData: userData.employer ?? "No data available."),
        const SizedBox(height: 10),
        SettingsDisplayField(fieldName: "Job Title", fieldData: userData.jobTitle ?? "No data available."),
        const SizedBox(height: 10),
        SettingsDisplayField(
          fieldName: "Gross annual income",
          fieldData: userData.salary != null ? format.formatDollars(userData.salary!) : "",
        ),
        const SizedBox(height: 10),
        SettingsDisplayField(
          fieldName: "Pay frequency",
          fieldData: userData.payFrequency?.label ?? "No data available.",
        ),
        const SizedBox(height: 10),
        SettingsDisplayField(
          fieldName: "Employer address",
          fieldData: userData.employerAddress ?? "No data available.",
        ),
        const SizedBox(height: 10),
        SettingsDisplayField(
          fieldName: "Time with employer",
          fieldData: userData.yearsWithEmployer != null && userData.monthsWithEmployer != null
              ? "${userData.yearsWithEmployer} year ${userData.monthsWithEmployer} months"
              : "No data available.",
        ),
        const SizedBox(height: 10),
        SettingsDisplayField(
          fieldName: "Next payday",
          fieldData: userData.nextPayDay != null
              ? format.formattedWithOrdinalAndDay(userData.nextPayDay!)
              : "No data available.",
        ),
        const SizedBox(height: 10),
        SettingsDisplayField(
          fieldName: "Is your pay a direct deposit",
          fieldData: userData.isDirectDeposit != null
              ? userData.isDirectDeposit!
                    ? "Yes"
                    : "No"
              : "No data available.",
        ),
        const SizedBox(height: 30),
        SettingsButton(
          textColor: AppColors.headBackground,
          backgroundColor: AppColors.white,
          borderColor: AppColors.headBackground,
          buttonText: "Edit",
          onPressedCallback: onEnter,
        ),
        const SizedBox(height: 5),
        SettingsButton(
          textColor: AppColors.white,
          backgroundColor: AppColors.headBackground,
          buttonText: "Confirm",
          onPressedCallback: onEnter,
        ),
      ],
    );
  }
}
