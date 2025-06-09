import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/util/string_formater.dart';

import '../../../../../common/styles/app_colors.dart';
import '../../../../../common/styles/app_text_styles.dart';

class SettingsDateField extends StatelessWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onChanged;
  final FormFieldValidator<DateTime>? validator;
  final bool autoValidate;

  const SettingsDateField({
    super.key,
    required this.initialDate,
    required this.onChanged,
    required this.validator,
    this.autoValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    final format = StringFormater();
    return FormField<DateTime>(
      initialValue: initialDate,
      validator: validator,
      autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      builder: (formFieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: formFieldState.value ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  formFieldState.didChange(picked);
                  onChanged(picked);
                }
              },
              child: InputDecorator(
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
                  hintText: 'Select a date',
                  suffixIcon: const Icon(Icons.calendar_today, size: 18),
                  errorText: formFieldState.errorText,
                ),
                child: Text(
                  formFieldState.value != null ? format.formattedWithOrdinalAndDay(formFieldState.value!) : '',
                  style: AppTextStyles.settingsStaticFieldData,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
