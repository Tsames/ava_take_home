import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

import '../../../../../common/styles/app_colors.dart';

class SettingsTextInput extends StatelessWidget {
  final String? initialValue;
  final String prefix;
  final int minLines;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String?> validator;
  final bool autoValidate;

  const SettingsTextInput({
    super.key,
    required this.initialValue,
    this.prefix = '',
    this.minLines = 1,
    this.maxLines = 3,
    required this.onChanged,
    required this.validator,
    this.autoValidate = true,
  });

  // late final TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _controller,
      validator: validator,
      initialValue: initialValue,
      autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      keyboardType: TextInputType.text,
      style: AppTextStyles.settingsEditFieldData,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.headBackground),
        ),
      ),
    );
  }
}
