import 'package:flutter/material.dart';

import 'package:shopit/src/constants/colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: Colors.blue.shade900,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorShape: CircleBorder(),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: surfaceContainer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue.shade900,
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: Colors.blue.shade900,
        ),
      ),
    );
  }
}
