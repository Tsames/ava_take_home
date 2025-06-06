import 'package:flutter/material.dart';

import '../../common/styles/app_colors.dart';

class StyledCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const StyledCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardOutline, width: 1),
      ),
      padding: padding ?? const EdgeInsets.all(16),
      child: child, // The variable content
    );
  }
}
