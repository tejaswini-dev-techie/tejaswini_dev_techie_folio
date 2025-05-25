import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary Colors
  static const Color midnightNavy = Color(0xFF0F172A);
  static const Color electricIndigo = Color(0xFF6366F1);
  static const Color softCyan = Color(0xFF67E8F9);
  static const Color softWhite = Color(0xFFF8FAFC);

  // Secondary Colors
  static const Color deepIndigo = Color(0xFF4F46E5);
  static const Color lightIndigo = Color(0xFF818CF8);
  static const Color darkIndigo = Color(0xFF312E81);

  // Accent Colors
  static const Color coral = Color(0xFFFB7185);
  static const Color mint = Color(0xFF34D399);
  static const Color amber = Color(0xFFFBBF24);

  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textTertiary = Color(0xFFCBD5E1);

  // Background Colors
  static const Color background = midnightNavy;
  static const Color surface = Color(0xFF1E293B);
  static const Color surfaceLight = Color(0xFF334155);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    electricIndigo,
    deepIndigo,
  ];

  static const List<Color> accentGradient = [
    softCyan,
    mint,
  ];

  static const List<Color> heroGradient = [
    Color(0xFF0F172A),
    Color(0xFF1E1B4B),
  ];

  // Shadows
  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: midnightNavy.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get glowShadow => [
        BoxShadow(
          color: electricIndigo.withOpacity(0.3),
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ];

  // Gradients
  static LinearGradient get primaryLinearGradient => const LinearGradient(
        colors: primaryGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get accentLinearGradient => const LinearGradient(
        colors: accentGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get heroLinearGradient => const LinearGradient(
        colors: heroGradient,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  // Text Styles
  static TextStyle get heroTitle => const TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        height: 1.1,
        letterSpacing: -1,
      );

  static TextStyle get heroSubtitle => const TextStyle(
        fontSize: 24,
        color: textSecondary,
        height: 1.5,
        letterSpacing: 0.5,
      );

  static TextStyle get sectionTitle => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        height: 1.2,
        letterSpacing: -0.5,
      );

  static TextStyle get sectionSubtitle => const TextStyle(
        fontSize: 18,
        color: textSecondary,
        height: 1.5,
        letterSpacing: 0.2,
      );

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 800);

  // Border Radius
  static const double borderRadiusSmall = 8;
  static const double borderRadiusMedium = 12;
  static const double borderRadiusLarge = 16;
  static const double borderRadiusXLarge = 24;

  // Spacing
  static const double spacingXSmall = 4;
  static const double spacingSmall = 8;
  static const double spacingMedium = 16;
  static const double spacingLarge = 24;
  static const double spacingXLarge = 32;
  static const double spacingXXLarge = 48;

  // Theme Data
  static ThemeData get lightTheme => ThemeData(
        primaryColor: midnightNavy,
        scaffoldBackgroundColor: midnightNavy,
        colorScheme: const ColorScheme.dark(
          primary: electricIndigo,
          secondary: softCyan,
          background: midnightNavy,
          surface: surface,
        ),
        textTheme: TextTheme(
          displayLarge: sectionTitle,
          displayMedium: sectionSubtitle,
          bodyLarge: bodyStyle,
          labelLarge: buttonStyle,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: electricIndigo,
            foregroundColor: softWhite,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: surface,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static TextStyle get bodyStyle => GoogleFonts.inter(
        fontSize: 16,
        color: textSecondary,
      );

  static TextStyle get buttonStyle => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: softWhite,
      );
}
 