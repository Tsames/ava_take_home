import 'dart:ui';

import 'package:meet_ava_take_home/common/styles/app_colors.dart';

enum Rating {
  excellent('Excellent', 5, AppColors.middleGreen),
  good('Good', 4, AppColors.lightGreen),
  fair('Fair', 3, AppColors.fair),
  unsatisfactory('Unsatisfactory', 2, AppColors.unsatisfactory),
  poor('Poor', 1, AppColors.poor);

  final String label;
  final int numericValue;
  final Color color;

  const Rating(this.label, this.numericValue, this.color);
}
