import 'dart:ui';

abstract class AppColors {
  // Containers
  static const Color pageBackground = Color(0xFFF2F0ED);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color outline = Color(0x26000000);
  static const Color headBackground = Color(0xFF420085);

  // Text Colors
  static const Color deepPurple = Color(0xFF2A1E39);
  static const Color pink = Color(0xFFA448FF);
  static const Color lightPurple = Color(0xFF736B7C);
  static const Color lightGray = Color(0xFFD8D5D9);
  static const Color white = Color(0xFFFFFFFF);

  // Graphic Colors
  static const Color lightGreen = Color(0xFFA9EACE);
  static const Color middleGreen = Color(0xFF48A388);
  static const Color darkGreen = Color(0xFF003928);

  // Rating colors
  static const Color excellent = darkGreen;
  static const Color good = middleGreen;
  static const Color fair = Color(0xFFFFD166);
  static const Color unsatisfactory = Color(0xFFF77F00);
  static const Color poor = Color(0xFFEF476F);
}
