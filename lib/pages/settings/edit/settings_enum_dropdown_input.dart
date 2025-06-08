import 'package:flutter/material.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/styles/app_text_styles.dart';
import '../../../common/user_data.dart';

class SettingsEnumDropdownInput<T extends Enum> extends StatelessWidget {
  final T initialValue;
  final EnumWrapper<T> enumWrapper;
  final ValueChanged<T?> onChanged;

  const SettingsEnumDropdownInput({
    super.key,
    required this.initialValue,
    required this.enumWrapper,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: initialValue,
      onChanged: onChanged,
      style: AppTextStyles.settingsStaticFieldData,
      items: enumWrapper.values.map((value) {
        return DropdownMenuItem<T>(value: value, child: Text(enumWrapper.getLabel(value)));
      }).toList(),
      icon: Icon(Icons.keyboard_arrow_down, color: AppColors.headBackground),
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
