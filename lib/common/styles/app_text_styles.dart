import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  //Card Text Styles
  static const sectionHeadlineStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.deepPurpleText,
  );

  static const cardHeadlineStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.deepPurpleText,
  );

  static const cardHeadlineLightStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.deepPurpleText,
  );

  static const cardBodyDetailsStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.lightPurpleText,
  );

  static const cardPointsStyle = TextStyle(
    fontFamily: "AtHauss",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteText,
  );

  static const cardSmallBodyStyle = TextStyle(fontFamily: "AtHauss", fontSize: 12);
}

// // Card Headline Text
// headlineSmall: TextStyle(
// fontFamily: "AtHauss",
// fontSize: 16,
// fontWeight: FontWeight.w600,
// color: Color(0xFF2A1E39),
// ),
// // Light Card Body Text
// bodyMedium: TextStyle(
// fontFamily: "AtHauss",
// fontSize: 14,
// fontWeight: FontWeight.w400,
// color: Color(0xFF736B7C),
// ),
// // Experian and light pink text
// bodySmall: TextStyle(
// fontFamily: "AtHauss",
// fontSize: 12,
// fontWeight: FontWeight.w600,
// color: Color(0xFFA448FF),
// ),
// // Points Style
// labelMedium: TextStyle(
// fontFamily: "AtHauss",
// fontSize: 14,
// fontWeight: FontWeight.w600,
// color: Color(0xFFFFFFFF),
// ),
