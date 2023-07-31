import 'package:flutter/material.dart';

import 'package:shopit/src/constants/colors.dart';

class CustomTheme {
  const CustomTheme({
    required this.brightness,
    required this.seedColor,
  });

  final Brightness brightness;
  final Color seedColor;

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: seedColor,
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
        fillColor: brightness == Brightness.light
            ? surfaceContainerLight(seedColor.value)
            : surfaceContainerDark(seedColor.value),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          backgroundColor: seedColor.withOpacity(.7),
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: seedColor.withOpacity(.7),
        ),
      ),
    );
  }
}
