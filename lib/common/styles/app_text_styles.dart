import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  //Home Page Text Styles
  static const sectionHeadlineStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.deepPurple,
  );

  static const cardHeadlineStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.deepPurple,
  );

  static const cardHeadlineLightStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.deepPurple,
  );

  static const cardBodyDetailsStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.lightPurple,
  );

  static const cardPointsStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const cardSmallBodyStyle = TextStyle(fontFamily: "AtHauss", fontSize: 12);

  // Settings Pages Text Styles
  static const settingsHeadlineStyle = TextStyle(
    fontFamily: "AtSlam",
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppColors.deepPurple,
  );

  static const settingsSubHeadlineStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.lightPurple,
  );

  static const settingsStaticFieldName = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 12,
    color: AppColors.lightPurple,
    fontWeight: FontWeight.w400,
  );

  static const settingsStaticFieldData = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 16,
    color: AppColors.deepPurple,
    fontWeight: FontWeight.w400,
  );
}
