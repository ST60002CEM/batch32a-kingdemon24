import 'package:flutter/material.dart';

ThemeData getApplicationTheme(bool isDark) {
  return ThemeData(
    scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,
    brightness: isDark ? Brightness.dark : Brightness.light,
    primarySwatch: Colors.blue,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
