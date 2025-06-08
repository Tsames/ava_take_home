import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/styles/app_text_styles.dart';

class SettingsDateField extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateSelected;
  final String hintText;
  final FormFieldValidator<DateTime>? validator;

  const SettingsDateField({
    super.key,
    this.initialDate,
    required this.onDateSelected,
    this.hintText = 'Select date',
    this.validator,
  });

  @override
  State<SettingsDateField> createState() => _SettingsDateFieldState();
}

class _SettingsDateFieldState extends State<SettingsDateField> {
  late DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: _selectedDate,
      validator: widget.validator,
      builder: (formFieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _selectDate(context),
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
                  hintText: widget.hintText,
                  suffixIcon: const Icon(Icons.calendar_today, size: 18),
                  errorText: formFieldState.errorText,
                ),
                child: Text(
                  _selectedDate != null ? DateFormat('MMM d, yyyy').format(_selectedDate!) : '',
                  style: AppTextStyles.settingsStaticFieldData,
                ),
              ),
            ),
            if (formFieldState.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  formFieldState.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
      widget.onDateSelected(picked);
    }
  }
}
