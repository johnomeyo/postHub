import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme? textTheme;
  const MaterialTheme({this.textTheme});
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF3D405B), // Use the specified color as primary
      onPrimary: Color(0xFFFFFFFF), // Text color on primary
      secondary: Color(0xFF81B29A), // A complementary color for secondary
      onSecondary: Color(0xFFFFFFFF), // Text color on secondary
      error: Color(0xFFBF1650), // A suitable error color
      onError: Color(0xFFFFFFFF), // Text color on error
      surface: Color(0xFFECECEC), // Light surface color
      onSurface: Color(0xFF3D405B), // Text color on background
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF3D405B), // Use the specified color as primary
      onPrimary: Color(0xFFFFFFFF), // Text color on primary
      secondary: Color(0xFF81B29A), // A complementary color for secondary
      onSecondary: Color(0xFF3D405B), // Text color on secondary
      error: Color(0xFFFF4C4C), // A suitable error color
      onError: Color(0xFFFFFFFF), // Text color on error
      surface: Color(0xFF2B2D42), // Dark surface color
      onSurface: Color(0xFFECECEC), // Text color on background
    );
  }

  static ThemeData lightTheme() {
    final colorScheme = lightScheme();
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: const TextTheme(), // You can customize this further
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
    );
  }

  static ThemeData darkTheme() {
    final colorScheme = darkScheme();
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: const TextTheme(), // You can customize this further
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
    );
  }
}
