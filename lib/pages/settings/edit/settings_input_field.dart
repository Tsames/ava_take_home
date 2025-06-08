import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

class SettingsInputField extends StatelessWidget {
  final String fieldName;
  final Widget child;

  const SettingsInputField({super.key, required this.fieldName, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: AppTextStyles.settingsEditFieldName),
        SizedBox(height: 5),
        child,
      ],
    );
  }
}
