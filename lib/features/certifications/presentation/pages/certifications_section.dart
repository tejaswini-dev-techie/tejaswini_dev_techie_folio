import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/section_title.dart';

class CertificationsSection extends StatelessWidget {
  CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SectionContainer(
      sectionId: AppConstants.certificationsId,
      backgroundColor: AppTheme.midnightNavy,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Certifications',
            subtitle: 'Professional achievements and continuous learning',
            titleColor: Colors.white,
            subtitleColor: AppTheme.softCyan,
          ),
          SizedBox(height: isMobile ? 32 : 48),
          // Timeline Container
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 24,
              vertical: isMobile ? 24 : 32,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.midnightNavy,
                  AppTheme.midnightNavy.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppTheme.electricIndigo.withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.electricIndigo.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                // Timeline
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _certifications.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: isMobile ? 16 : 24),
                  itemBuilder: (context, index) {
                    final cert = _certifications[index];
                    return _buildTimelineItem(context, cert, index, isMobile);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
      BuildContext context, Certification cert, int index, bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Line and Dot
        SizedBox(
          width: isMobile ? 60 : 100,
          child: Column(
            children: [
              Container(
                width: isMobile ? 8 : 12,
                height: isMobile ? 8 : 12,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.electricIndigo,
                      AppTheme.softCyan,
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.electricIndigo.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              if (index < _certifications.length - 1)
                Container(
                  width: 2,
                  height: isMobile ? 40 : 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
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
        // Certificate Content
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => _handleCertificateTap(cert),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: EdgeInsets.all(isMobile ? 16 : 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.midnightNavy.withOpacity(0.5),
                      AppTheme.midnightNavy.withOpacity(0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.electricIndigo.withOpacity(0.3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.electricIndigo.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Issuer Logo
                        Container(
                          padding: EdgeInsets.all(isMobile ? 6 : 8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppTheme.electricIndigo,
                                AppTheme.softCyan,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            cert.icon,
                            color: Colors.white,
                            size: isMobile ? 16 : 20,
                          ),
                        ),
                        SizedBox(width: isMobile ? 8 : 12),
                        // Title and Issuer
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cert.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: isMobile ? 14 : 16,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                cert.issuer,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppTheme.softCyan,
                                      fontWeight: FontWeight.w500,
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        // View Certificate Button
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 8 : 12,
                            vertical: isMobile ? 4 : 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppTheme.electricIndigo,
                                AppTheme.softCyan,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.electricIndigo.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified,
                                color: Colors.white,
                                size: isMobile ? 14 : 16,
                              ),
                              SizedBox(width: isMobile ? 4 : 8),
                              Text(
                                'View',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(duration: const Duration(milliseconds: 500)).slideX(
          begin: 0.2,
          end: 0,
          curve: Curves.easeOut,
        );
  }

  Future<void> _handleCertificateTap(Certification cert) async {
    if (cert.certificateUrl != null) {
      final uri = Uri.parse(cert.certificateUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  final List<Certification> _certifications = [
    Certification(
      title: 'Jira Fundamentals Badge',
      issuer: 'Atlassian',
      icon: Icons.work,
      certificateUrl:
          'https://university.atlassian.com/student/award/ch8ZcsA9kfVEaa17aYMs7eED',
    ),
    Certification(
      title: 'Flutter App Development',
      issuer: 'Udemy',
      icon: Icons.mobile_friendly,
      certificateUrl:
          'https://www.udemy.com/certificate/UC-1d137ce8-8551-4242-834c-7e06bbcf7832/',
    ),
    Certification(
      title: 'Android App Development',
      issuer: 'Internshala',
      icon: Icons.android,
    ),
    Certification(
      title: 'Introduction to Programming using Python',
      issuer: 'Microsoft Technology Associate (MTA)',
      icon: Icons.code,
      certificateUrl:
          'https://tejaswini-dev-techie.github.io/MTA%20Certificate.pdf',
    ),
    Certification(
      title: 'AI for Everyone & Deep Learning',
      issuer: 'Coursera',
      icon: Icons.psychology,
      certificateUrl:
          'https://coursera.org/share/cae64cedbf0f2f97683ae2f867ccf655',
    ),
    Certification(
      title: 'Python for Data Science',
      issuer: 'Learnbay',
      icon: Icons.data_object,
      certificateUrl:
          'https://tejaswini-dev-techie.github.io/Tejaswini%20D%20Python%20Certificate.pdf',
    ),
  ];
}

class Certification {
  final String title;
  final String issuer;
  final IconData icon;
  final String? certificateUrl;

  Certification({
    required this.title,
    required this.issuer,
    required this.icon,
    this.certificateUrl,
  });
}
