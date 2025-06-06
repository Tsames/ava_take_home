import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

class SettingsTextInput extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;

  const SettingsTextInput({super.key, required this.initialValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      style: AppTextStyles.settingsStaticFieldData,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
      ),
    );
  }
}
