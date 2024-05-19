import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.grey[100],
      fontFamily: 'OpenSans-BoldItalic',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 20, fontFamily: 'OpenSans-Bold'),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))));
}
