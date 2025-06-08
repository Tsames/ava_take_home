import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

import '../../../common/styles/app_colors.dart';

class SettingsMultilineInput extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;
  final int? maxLines;
  final int? minLines;

  const SettingsMultilineInput({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.maxLines = 5,
    this.minLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      style: AppTextStyles.settingsEditFieldData,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.headBackground),
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}
