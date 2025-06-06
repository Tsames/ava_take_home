import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/repository/state_provider.dart';
import 'package:meet_ava_take_home/pages/settings/display/settings_display_field.dart';
import 'package:meet_ava_take_home/pages/settings/settings_button.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/styles/app_text_styles.dart';
import '../../../common/util/string_formater.dart';

class SettingsDisplay extends ConsumerStatefulWidget {
  const SettingsDisplay({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsDisplay> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsDisplay> {
  @override
  Widget build(BuildContext context) {
    final format = StringFormater();
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.deepPurple),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Confirm your employment', style: AppTextStyles.settingsHeadlineStyle),
                    const Text(
                      'Please review and confirm the below employment details are up-to-date.',
                      style: AppTextStyles.settingsSubHeadlineStyle,
                    ),
                    const SizedBox(height: 30),
                    SettingsDisplayField(fieldName: "Employment type", fieldData: userData.employmentType.label),
                    const SizedBox(height: 10),
                    SettingsDisplayField(fieldName: "Employer", fieldData: userData.employer),
                    const SizedBox(height: 10),
                    SettingsDisplayField(fieldName: "Job Title", fieldData: userData.jobTitle),
                    const SizedBox(height: 10),
                    SettingsDisplayField(
                      fieldName: "Gross annual income",
                      fieldData: "${format.formatDollars(userData.salary)}",
                    ),
                    const SizedBox(height: 10),
                    SettingsDisplayField(fieldName: "Pay frequency", fieldData: userData.payFrequency.label),
                    const SizedBox(height: 10),
                    SettingsDisplayField(fieldName: "Employer address", fieldData: userData.employerAddress),
                    const SizedBox(height: 10),
                    SettingsDisplayField(
                      fieldName: "Time with employer",
                      fieldData: "${userData.yearsWithEmployer} year ${userData.monthsWithEmployer} months",
                    ),
                    const SizedBox(height: 10),
                    SettingsDisplayField(fieldName: "Next payday", fieldData: userData.nextPayDay.toString()),
                    const SizedBox(height: 10),
                    SettingsDisplayField(
                      fieldName: "Is your pay a direct deposit",
                      fieldData: userData.isDirectDeposit.toString(),
                    ),
                    const SizedBox(height: 30),
                    SettingsButton(
                      textColor: AppColors.headBackground,
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.headBackground,
                      buttonText: "Edit",
                      onPressedCallback: () => {},
                    ),
                    const SizedBox(height: 5),
                    SettingsButton(
                      textColor: AppColors.white,
                      backgroundColor: AppColors.headBackground,
                      buttonText: "Confirm",
                      onPressedCallback: () => {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
