import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/home_page.dart';

void main() {
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
            outline: const Color(0x26000000),
            surface: const Color(0xFFF2F0ED),
        )
      ),
    );
  }
}
