import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';

class CustomTheme {
  const CustomTheme({
    required this.brightness,
    required this.seedColor,
  });

  final Brightness brightness;
  final Color seedColor;

  ThemeData get theme {
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(
            allowEnterRouteSnapshotting: false,
          ),
        },
      ),
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
          shadowColor: const Color.fromARGB(0, 0, 0, 0),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: seedColor,
          disabledForegroundColor: const Color.fromARGB(255, 255, 255, 255),
          disabledBackgroundColor: seedColor.withAlpha(150),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
