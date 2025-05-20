import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, TABLET);

    return SectionContainer(
      sectionId: AppConstants.projectsId,
      backgroundColor: AppTheme.softWhite,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Projects',
            subtitle: 'Featured work that showcases my expertise',
          ),
          const SizedBox(height: 48),
          // Projects Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile
                ? 1
                : isTablet
                    ? 2
                    : 3,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 0.8,
            children: _projects
                .map((project) => _buildProjectCard(context, project))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Project project) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.electricIndigo,
                  AppTheme.softCyan,
                ],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        project.icon,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            project.subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                          ),
                        ],
                      ),
                    ),
                    // Download Link Button
                    if (project.downloadLink != null)
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          onTap: () {
                            // Launch URL
                            launchUrl(Uri.parse(project.downloadLink!));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  project.isWebsite
                                      ? Icons.language
                                      : Icons.download,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  project.isWebsite ? 'Visit' : 'Download',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.technologies
                      .map((tech) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tech,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          // Project Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textSecondary,
                          height: 1.6,
                        ),
                  ),
                  const SizedBox(height: 24),
                  // Key Features
                  if (project.features.isNotEmpty) ...[
                    Text(
                      'Key Features',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppTheme.electricIndigo,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    ...project.features.map((feature) => Padding(
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
                                  feature,
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
                  // Impact Metrics
                  if (project.metrics.isNotEmpty) ...[
                    Text(
                      'Impact',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppTheme.electricIndigo,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    ...project.metrics.map((metric) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.trending_up,
                                color: AppTheme.softCyan,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  metric,
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
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500)).slideY(
          begin: 0.2,
          end: 0,
          curve: Curves.easeOut,
        );
  }

  final List<Project> _projects = [
    Project(
      title: 'Boss Wallah',
      subtitle: 'Be the Boss App',
      icon: Icons.school,
      description:
          'A comprehensive learning platform empowering users with expert-led courses in finance, business, and agriculture. Built with scalability and user engagement in mind.',
      technologies: [
        'Flutter',
        'Dart',
        'Python FastAPI',
        'Firebase',
        'AWS',
      ],
      features: [
        '500+ expert-led courses available in 6 languages',
        'Interactive live webinars with real-time Q&A sessions',
        '1-on-1 expert consultations for personalized learning',
        'Real-time chat system for enhanced user engagement',
        'On-demand multi-language video library',
        'Scalable backend with FastAPI and analytics',
      ],
      metrics: [
        '1M+ active users across platforms',
        '4.4/5 star rating from 70.1K+ reviews',
        '10,000+ concurrent users in live sessions',
        '6 languages supported for global reach',
      ],
      downloadLink:
          'https://play.google.com/store/apps/details?id=com.wealthdoctor&hl=en_IN&gl=US&pli=1',
      isWebsite: false,
    ),
    Project(
      title: 'Lead Market',
      subtitle: 'Financial Advisor Platform',
      icon: Icons.people_alt,
      description:
          'A sophisticated platform connecting financial advisors with potential clients through an intelligent Campaign Manager system. The app uses advanced matching algorithms to create meaningful connections based on location, demographics, and financial goals.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'Google Maps',
      ],
      features: [
        'Intelligent Campaign Manager for lead generation',
        'Location-based matching system',
        'Demographic and financial goal analysis',
        'Real-time lead tracking and management',
        'Interactive map interface for location-based searches',
        'Secure data handling and privacy compliance',
      ],
      metrics: [
        '85% increase in lead conversion rate',
        '50% reduction in lead acquisition time',
        '3x improvement in advisor-client matching accuracy',
        '10,000+ successful matches made',
      ],
      downloadLink: null,
      isWebsite: false,
    ),
    Project(
      title: 'IM Team',
      subtitle: 'CRM & Partner Management',
      icon: Icons.business,
      description:
          'A comprehensive CRM solution designed for relationship management and partner retention. The app streamlines team leadership, payment tracking, and partner relationship management in a single platform.',
      technologies: [
        'Flutter',
        'Dart',
      ],
      features: [
        'Advanced CRM functionality for partner management',
        'Team leadership and performance tracking',
        'Automated payment follow-up system',
        'Partner retention analytics and insights',
        'Real-time team collaboration tools',
        'Customizable reporting dashboard',
      ],
      metrics: [
        '40% improvement in partner retention rate',
        '60% reduction in payment follow-up time',
        '75% increase in team productivity',
        '95% on-time payment collection rate',
      ],
      downloadLink: null,
      isWebsite: false,
    ),
    Project(
      title: 'GOGAME',
      subtitle: 'Gaming Platform',
      icon: Icons.sports_esports,
      description:
          'A dynamic gaming platform offering daily tournaments with real cash prizes. Focused on delivering seamless multiplayer experiences and secure payment processing.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'Google Maps',
        'Payment Gateways',
      ],
      features: [
        'Real-time multiplayer gaming functionality',
        'Seamless game transitions and intuitive UI',
        'Integrated payment solutions for tournaments',
        'Location-based gaming features',
        'Real-time leaderboards and achievements',
      ],
      metrics: [
        '1000+ concurrent users in tournaments',
        '40% increase in user engagement',
        '25% improvement in app performance',
      ],
      downloadLink: 'https://www.gogame.in/',
      isWebsite: true,
    ),
    Project(
      title: 'HISY',
      subtitle: 'Digital Agency Website',
      icon: Icons.web,
      description:
          'A modern corporate website for a digital agency, built with performance, SEO, and brand presence in mind. Delivering an exceptional user experience across all devices.',
      technologies: [
        'Python',
        'Flask',
        'HTML/CSS',
        'SASS',
        'JavaScript',
        'SEO',
      ],
      features: [
        'SEO-optimized content and structure',
        'Responsive and modern UI/UX design',
        'Custom CMS for easy content management',
        'Performance-optimized assets and queries',
      ],
      metrics: [
        '40% improvement in page load speed',
        '60% increase in organic traffic',
        '50% reduction in content update time',
      ],
      downloadLink: 'https://www.hisy.in/',
      isWebsite: true,
    ),
  ];
}

class Project {
  final String title;
  final String subtitle;
  final IconData icon;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final List<String> metrics;
  final String? downloadLink;
  final bool isWebsite;

  Project({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.description,
    required this.technologies,
    required this.features,
    required this.metrics,
    this.downloadLink,
    this.isWebsite = false,
  });
}
