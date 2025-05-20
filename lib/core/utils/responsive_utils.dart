import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 120, vertical: 40);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 60, vertical: 30);
    } else {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
    }
  }

  static double getFontSize(
    BuildContext context, {
    required double desktop,
    required double tablet,
    required double mobile,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }

  static double getSpacing(
    BuildContext context, {
    required double desktop,
    required double tablet,
    required double mobile,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }

  static int getGridCrossAxisCount(BuildContext context) {
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }

  static double getContainerWidth(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    if (isDesktop(context)) return screenWidth * 0.8;
    if (isTablet(context)) return screenWidth * 0.9;
    return screenWidth;
  }

  // Responsive Image Size
  static double getImageSize(
    BuildContext context, {
    required double desktop,
    required double tablet,
    required double mobile,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }

  // Responsive Margin
  static EdgeInsets getMargin(
    BuildContext context, {
    required EdgeInsets desktop,
    required EdgeInsets tablet,
    required EdgeInsets mobile,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }

  // Responsive Border Radius
  static double getBorderRadius(
    BuildContext context, {
    required double desktop,
    required double tablet,
    required double mobile,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }
}
 