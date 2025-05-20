import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);

    return SectionContainer(
      sectionId: AppConstants.experienceId,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Experience',
            subtitle: 'My professional journey',
          ),
          const SizedBox(height: 48),
          // Experience Timeline
          ..._experiences.asMap().entries.map((entry) {
            final index = entry.key;
            final experience = entry.value;
            return _buildExperienceItem(context, experience, isMobile, index);
          }),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
      BuildContext context, Experience experience, bool isMobile, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        AppTheme.electricIndigo,
                        AppTheme.softCyan,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.electricIndigo.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                if (index < _experiences.length - 1)
                  Container(
                    width: 2,
                    height: 100,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.electricIndigo,
                          AppTheme.softCyan,
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Experience content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Role and Company
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.electricIndigo.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          experience.icon,
                          color: AppTheme.electricIndigo,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              experience.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppTheme.electricIndigo,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              experience.company,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppTheme.textSecondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
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
                          experience.duration,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppTheme.softCyan,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Description
                  Text(
                    experience.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textSecondary,
                          height: 1.6,
                        ),
                  ),
                  const SizedBox(height: 24),
                  // Achievements
                  if (experience.achievements.isNotEmpty) ...[
                    Text(
                      'Key Achievements',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppTheme.electricIndigo,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    ...experience.achievements.map((achievement) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: AppTheme.softCyan,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  achievement,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppTheme.textSecondary,
                                        height: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                  const SizedBox(height: 24),
                  // Tech Stack
                  if (experience.techStack.isNotEmpty) ...[
                    Text(
                      'Technologies',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppTheme.electricIndigo,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: experience.techStack
                          .map((tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      AppTheme.electricIndigo.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  tech,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppTheme.electricIndigo,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500)).slideX(
          begin: 0.2,
          end: 0,
          curve: Curves.easeOut,
        );
  }

  final List<Experience> _experiences = [
    Experience(
      title: 'Full-Stack Engineer',
      company: 'Boss Wallah Technologies',
      duration: '09/2020 - Present',
      icon: Icons.code,
      description:
          'Full-stack engineer developing enterprise-scale mobile applications and backend services. Contributing to high-performance solutions that serve millions of users across multiple platforms.',
      achievements: [
        'Developed cross-platform mobile apps achieving 1 Cr+ downloads with 4.4/5 star rating from 70.1K+ reviews',
        'Implemented scalable RESTful APIs using Python FastAPI, reducing response time by 30% and improving system reliability',
        'Applied Clean Architecture and SOLID principles, resulting in 50% increase in code reusability and 40% reduction in bug reports',
        'Integrated payment gateways (Razorpay and PhonePe) and implemented multi-language support across 6 languages',
        'Built real-time video communication features using 100ms SDK, enabling 10,000+ concurrent users in interactive webinars',
        'Implemented CI/CD pipelines using GitHub Actions and Bitrise, reducing deployment time by 60% and release cycle by 30%',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Python FastAPI',
        'Firebase',
        'AWS',
        'Razorpay',
        '100ms SDK',
      ],
    ),
    Experience(
      title: 'Flutter Developer Intern',
      company: 'Gogame',
      duration: '06/2020 - 09/2020',
      icon: Icons.sports_esports,
      description:
          'Contributed to the development of high-performance gaming applications, focusing on real-time multiplayer features and location-based services. Collaborated with cross-functional teams to deliver engaging user experiences.',
      achievements: [
        'Developed responsive gaming UIs using MVVM architecture, improving app performance by 25%',
        'Integrated Google Maps API for location-based features, enhancing user engagement by 40%',
        'Created reusable Flutter widgets library, reducing development time by 30%',
        'Implemented Firebase Cloud Functions for backend services, handling 1000+ concurrent users',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'MVVM',
        'Google Maps',
        'Firebase',
        'PhonePe/Paytm',
      ],
    ),
    Experience(
      title: 'Full Stack Developer Intern',
      company: 'HISY Advertising Solutions',
      duration: '12/2019 - 05/2020',
      icon: Icons.web,
      description:
          'Developed and optimized web applications for digital marketing solutions. Focused on creating responsive, user-friendly interfaces while implementing SEO best practices.',
      achievements: [
        'Built responsive company website using Python Flask, achieving 40% improvement in page load speed',
        'Implemented SEO optimizations resulting in 60% increase in organic traffic',
        'Developed custom CMS features reducing content update time by 50%',
        'Optimized database queries and frontend assets, improving overall performance by 40%',
      ],
      techStack: [
        'Python',
        'Flask',
        'HTML/CSS',
        'SASS'
        'JavaScript',
        'SEO',
      ],
    ),
  ];
}

class Experience {
  final String title;
  final String company;
  final String duration;
  final IconData icon;
  final String description;
  final List<String> achievements;
  final List<String> techStack;

  Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.icon,
    required this.description,
    this.achievements = const [],
    this.techStack = const [],
  });
}
