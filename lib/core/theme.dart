import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData _themeData = ThemeData(
      scaffoldBackgroundColor: const Color(0xff06041F),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff1F1D35),
      ),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
          headlineMedium: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
          labelSmall: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
          headlineSmall: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      useMaterial3: true);
  ThemeData get theme => _themeData;
}
