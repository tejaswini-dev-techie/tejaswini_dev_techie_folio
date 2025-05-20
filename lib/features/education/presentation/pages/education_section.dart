import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/section_title.dart';

class EducationSection extends StatelessWidget {
  EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, TABLET);

    return SectionContainer(
      sectionId: AppConstants.educationId,
      backgroundColor: AppTheme.softWhite,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Education',
            subtitle: 'Academic journey and qualifications',
          ),
          const SizedBox(height: 48),
          // Education Timeline
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _education.length,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, index) {
              final education = _education[index];
              return _buildEducationCard(context, education);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context, Education education) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.midnightNavy.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Timeline Line
            Container(
              width: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.electricIndigo,
                    AppTheme.softCyan,
                  ],
                ),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.electricIndigo.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        education.icon,
                        color: AppTheme.softWhite,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Date
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.softCyan.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              education.date,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppTheme.softCyan,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Degree
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppTheme.electricIndigo,
                                  AppTheme.softCyan,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppTheme.electricIndigo.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Text(
                              education.degree,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.2,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Institution
                          Text(
                            education.institution,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppTheme.softCyan,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.1,
                                ),
                          ),
                          if (education.description != null) ...[
                            const SizedBox(height: 16),
                            Text(
                              education.description!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppTheme.textSecondary,
                                    height: 1.6,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500)).slideX(
          begin: 0.2,
          end: 0,
          curve: Curves.easeOut,
        );
  }

  final List<Education> _education = [
    Education(
      date: 'AUG 2016 – AUG 2020',
      degree: 'B.E. in Computer Science',
      institution: 'Sri Siddhartha Institute of Technology',
      icon: Icons.school,
      description:
          'Graduated with distinction, focusing on software development and computer systems. Specialized in advanced programming concepts, database management, and software architecture.',
    ),
  ];
}

class Education {
  final String date;
  final String degree;
  final String institution;
  final IconData icon;
  final String? description;

  Education({
    required this.date,
    required this.degree,
    required this.institution,
    required this.icon,
    this.description,
  });
}
