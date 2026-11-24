import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF4935F5);
  static const Color logoBlue = Color(0xFF1674D2);
  static const Color background = Color(0xFFF0F3F8);
  static const Color inputBackground = Color(0xFFE3E8ED);
  static const Color textDark = Color(0xFF20242A);
  static const Color textMuted = Color(0xFF59616B);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        surface: background,
      ),
      fontFamily: 'Roboto',
    );
  }
}
