import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

class SettingsDisplayField extends StatelessWidget {
  final String fieldName;
  final String fieldData;
  final Widget child;

  const SettingsDisplayField({super.key, required this.fieldName, required this.fieldData, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: AppTextStyles.settingsStaticFieldName),
        child,
      ],
    );
  }
}
