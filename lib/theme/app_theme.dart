import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- NEW DESIGN SYSTEM ---

  // 1. COLORS
  static const Color primary = Color(0xFF0052FF); // Modern, professional blue
  static const Color accent = Color(0xFF00A9E0); // Vibrant, yet professional accent
  static const Color secondary = Color(0xFFF5F8FA); // Light, clean grey
  static const Color text = Color(0xFF2D3748); // Dark, readable grey
  static const Color bodyText = Color(0xFF4A5D75);
  static const Color white = Colors.white; // Pure white

  // 2. SPACING
  static const double space_8 = 8.0;
  static const double space_16 = 16.0;
  static const double space_24 = 24.0;
  static const double space_32 = 32.0;
  static const double space_48 = 48.0;
  static const double space_64 = 64.0;

  // 3. TYPOGRAPHY (using Inter from google_fonts)
  static TextTheme get _textTheme {
    final baseTheme = GoogleFonts.interTextTheme();
    return baseTheme.copyWith(
      displayLarge: baseTheme.displayLarge?.copyWith(fontSize: 58, fontWeight: FontWeight.w700, color: text),
      displayMedium: baseTheme.displayMedium?.copyWith(fontSize: 48, fontWeight: FontWeight.w700, color: text),
      headlineLarge: baseTheme.headlineLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.w700, color: text),
      headlineMedium: baseTheme.headlineMedium?.copyWith(fontSize: 32, fontWeight: FontWeight.w700, color: text),
      titleLarge: baseTheme.titleLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w700, color: text),
      titleMedium: baseTheme.titleMedium?.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: text),
      bodyLarge: baseTheme.bodyLarge?.copyWith(fontSize: 18, color: text, height: 1.6),
      bodyMedium: baseTheme.bodyMedium?.copyWith(fontSize: 16, color: bodyText, height: 1.5),
    );
  }

  // 4. THEME DATA
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: accent,
        surface: white,
      ),
      scaffoldBackgroundColor: white,
      textTheme: _textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        foregroundColor: text,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(space_8)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(horizontal: space_24, vertical: space_16),
          textStyle: _textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(space_8)),
          elevation: 2,
          shadowColor: primary.withValues(alpha: 0.2),
        ),
      ),
    );
  }
}
