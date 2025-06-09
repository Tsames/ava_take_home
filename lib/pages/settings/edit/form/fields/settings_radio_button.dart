import 'package:flutter/material.dart';

import '../../../../../common/styles/app_text_styles.dart';

class SettingsRadioButton extends StatelessWidget {
  final bool? initialValue;
  final ValueChanged<bool> onChanged;
  final FormFieldValidator<bool>? validator;
  final bool autoValidate;

  const SettingsRadioButton({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.validator,
    this.autoValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: initialValue,
      validator: validator,
      autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      builder: (formFieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: Text('Yes', style: AppTextStyles.settingsEditFieldData),
                    value: true,
                    groupValue: formFieldState.value,
                    onChanged: (value) {
                      formFieldState.didChange(value);
                      onChanged(value ?? false);
                    },
                    dense: true,
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: Text('No', style: AppTextStyles.settingsEditFieldData),
                    value: false,
                    groupValue: formFieldState.value,
                    onChanged: (value) {
                      formFieldState.didChange(value);
                      onChanged(value ?? false);
                    },
                    dense: true,
                  ),
                ),
              ],
            ),
            // Show validation error if exists
            if (formFieldState.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: Text(formFieldState.errorText!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
          ],
        );
      },
    );
  }
}
