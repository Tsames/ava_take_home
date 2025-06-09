import 'package:flutter/material.dart';

import '../../../../../common/styles/app_colors.dart';
import '../../../../../common/styles/app_text_styles.dart';

class SettingsDropdownInput extends StatelessWidget {
  final int? initialValue;
  final String units;
  final int maxValue;
  final ValueChanged<int?> onChanged;
  final FormFieldValidator<int> validator;
  final bool autoValidate;

  const SettingsDropdownInput({
    super.key,
    required this.initialValue,
    required this.units,
    required this.maxValue,
    required this.onChanged,
    required this.validator,
    this.autoValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: initialValue,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      style: AppTextStyles.settingsStaticFieldData,
      icon: Icon(Icons.keyboard_arrow_down, color: AppColors.headBackground),
      items: List.generate(maxValue + 1, (index) {
        return DropdownMenuItem<int>(value: index, child: Text('$index $units${index == 1 ? '' : 's'}'));
      }),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.headBackground),
        ),
      ),
    );
  }
}
