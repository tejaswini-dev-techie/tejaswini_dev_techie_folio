import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: AppTheme.softWhite,
              child: Center(
                child: ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  columnMainAxisAlignment: MainAxisAlignment.center,
                  columnCrossAxisAlignment: CrossAxisAlignment.center,
                  layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                      ? ResponsiveRowColumnType.ROW
                      : ResponsiveRowColumnType.COLUMN,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppConstants.appName,
                              style: Theme.of(context).textTheme.displayLarge,
                            )
                                .animate()
                                .fadeIn(
                                    duration:
                                        AppConstants.defaultAnimationDuration)
                                .slideX(begin: -0.3, end: 0),
                            const SizedBox(height: 16),
                            Text(
                              AppConstants.appTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: AppTheme.electricIndigo,
                                  ),
                            )
                                .animate()
                                .fadeIn(
                                    delay: const Duration(milliseconds: 200))
                                .slideX(begin: -0.3, end: 0),
                            const SizedBox(height: 8),
                            Text(
                              AppConstants.appSubtitle,
                              style: Theme.of(context).textTheme.titleLarge,
                            )
                                .animate()
                                .fadeIn(
                                    delay: const Duration(milliseconds: 400))
                                .slideX(begin: -0.3, end: 0),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO: Implement resume download
                                  },
                                  child: const Text('Download Resume'),
                                ),
                                const SizedBox(width: 16),
                                OutlinedButton(
                                  onPressed: () {
                                    // TODO: Implement contact navigation
                                  },
                                  child: const Text('Contact Me'),
                                ),
                              ],
                            )
                                .animate()
                                .fadeIn(
                                    delay: const Duration(milliseconds: 600))
                                .slideY(begin: 0.3, end: 0),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(32.0),
                        child: Center(
                          child: Icon(
                            Icons.code,
                            size: ResponsiveBreakpoints.of(context)
                                    .largerThan(MOBILE)
                                ? 400
                                : 200,
                            color: AppTheme.electricIndigo.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Additional sections will be added here
          ],
        ),
      ),
    );
  }
}
