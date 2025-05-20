import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: AppConfig.breakpoints,
      ),
      home: const HomePage(),
    );
  }
}
