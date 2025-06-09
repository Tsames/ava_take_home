import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

class SettingsButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color? borderColor;
  final String buttonText;
  final void Function() onPressedCallback;

  const SettingsButton({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor,
    required this.buttonText,
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressedCallback();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor ?? Colors.transparent, width: 2),
        ),
      ),
      child: Center(
        child: Text(buttonText, style: AppTextStyles.cardHeadlineStyle.copyWith(color: textColor)),
      ),
    );
  }
}
