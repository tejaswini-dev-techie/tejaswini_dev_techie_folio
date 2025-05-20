import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme/app_theme.dart';

class AppConfig {
  static const String appName = 'Tejaswini Dev';
  static const String appVersion = '1.0.0';

  // Navigation
  static const List<String> navItems = [
    'Home',
    'About',
    'Skills',
    'Experience',
    'Projects',
    'Education',
    'Certifications',
    'Contact',
  ];

  // Social Links
  static const Map<String, String> socialLinks = {
    'GitHub': 'https://github.com/yourusername',
    'LinkedIn': 'https://linkedin.com/in/yourusername',
    'Twitter': 'https://twitter.com/yourusername',
    'Email': 'mailto:your.email@example.com',
  };

  // Resume
  static const String resumeUrl = 'https://example.com/resume.pdf';

  // Responsive Breakpoints
  static List<Breakpoint> get breakpoints => [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ];

  // Animation Durations
  static const Duration pageTransitionDuration = Duration(milliseconds: 300);
  static const Duration sectionAnimationDuration = Duration(milliseconds: 500);
  static const Duration buttonAnimationDuration = Duration(milliseconds: 200);

  // Spacing
  static const double defaultSpacing = 24.0;
  static const double smallSpacing = 16.0;
  static const double largeSpacing = 32.0;

  // Border Radius
  static const double defaultBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;

  // Shadows
  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ];

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppTheme.midnightNavy, AppTheme.surface],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [AppTheme.electricIndigo, AppTheme.softCyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
 