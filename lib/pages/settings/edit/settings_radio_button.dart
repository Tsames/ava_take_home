import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

import '../../../common/styles/app_colors.dart';

class SettingsRadioButton extends StatelessWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SettingsRadioButton({super.key, required this.initialValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<bool>(
            title: Text('Yes', style: AppTextStyles.settingsEditFieldData),
            value: true,
            groupValue: initialValue,
            onChanged: (value) => onChanged(value ?? false),
            dense: true,
          ),
        ),
        Expanded(
          child: RadioListTile<bool>(
            activeColor: AppColors.headBackground,
            title: Text('No', style: AppTextStyles.settingsEditFieldData),
            value: false,
            groupValue: initialValue,
            onChanged: (value) => onChanged(value ?? false),
            dense: true,
          ),
        ),
      ],
    );
  }
}
