import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_ava_take_home/home_page.dart';

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
            onPrimary: const Color(0xFF2A1E39),
            onPrimaryFixed: const Color(0xFF736B7C),
            onPrimaryFixedVariant: const Color(0xFFA448FF),
            secondary: const Color(0xFF48A388),
            secondaryContainer: const Color(0xFFA9EACE),
            tertiaryContainer: const Color(0xFF420085),
            onTertiaryContainer: const Color(0xFFFFFFFF),
            outline: const Color(0x26000000),
            surface: const Color(0xFFF2F0ED),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontFamily: "AtHauss", fontSize: 16, fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(fontFamily: "AtHauss", fontSize: 22),
          bodyMedium: TextStyle(fontFamily: "AtHauss", fontSize: 14),
          bodySmall: TextStyle(fontFamily: "AtHauss", fontSize: 12),
          labelLarge: TextStyle(fontFamily: "AtSlamCnd", fontSize: 36, fontWeight: FontWeight.w600),
        )
      ),
    );
  }
}
