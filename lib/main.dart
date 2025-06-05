import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_ava_take_home/pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const AvaApp());
}

class AvaApp extends StatelessWidget {
  const AvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primaryContainer: const Color(0xFFFFFFFF),
          // Card background
          onPrimary: const Color(0xFF2A1E39),
          // Section titles and large text color
          onPrimaryFixed: const Color(0xFF736B7C),
          // Small text on cards
          onPrimaryFixedVariant: const Color(0xFFA448FF),
          // Other small text on cards
          secondaryContainer: const Color(0xFF420085),
          secondary: const Color(0xFFFFFFFF),
          tertiaryContainer: const Color(0xFFA9EACE),
          // Dial Background
          tertiary: const Color(0xFF48A388),
          // Dial Foreground
          outline: const Color(0x26000000),
          surface: const Color(0xFFF2F0ED),
        ),
        textTheme: const TextTheme(
          // Card Headline Text
          headlineSmall: TextStyle(
            fontFamily: "AtHauss",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2A1E39),
          ),
          headlineMedium: TextStyle(
            fontFamily: "AtHauss",
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2A1E39),
          ),
          // Light Card Body Text
          bodyMedium: TextStyle(
            fontFamily: "AtHauss",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF736B7C),
          ),
          // Experian and light pink text
          bodySmall: TextStyle(
            fontFamily: "AtHauss",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFFA448FF),
          ),
          // Large Animated Dial Text
          // Points Style
          labelMedium: TextStyle(
            fontFamily: "AtHauss",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
          ),
          //Small Animated Dial Text
          labelSmall: TextStyle(
            fontFamily: "AtHauss",
            fontSize: 8,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2A1E39),
          ),
        ),
      ),
    );
  }
}
