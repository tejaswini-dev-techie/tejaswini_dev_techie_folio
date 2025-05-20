import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'features/home/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(
              start: 0, end: AppConstants.mobileBreakpoint, name: MOBILE),
          const Breakpoint(
              start: AppConstants.mobileBreakpoint + 1,
              end: AppConstants.tabletBreakpoint,
              name: TABLET),
          const Breakpoint(
              start: AppConstants.tabletBreakpoint + 1,
              end: AppConstants.desktopBreakpoint,
              name: DESKTOP),
          const Breakpoint(
              start: AppConstants.desktopBreakpoint + 1,
              end: double.infinity,
              name: '4K'),
        ],
      ),
      home: const HomePage(),
    );
  }
}
