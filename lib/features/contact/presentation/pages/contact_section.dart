import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);
    // final isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, TABLET);
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Consider screens smaller than 600 as mobile
    final isMobile = screenWidth < 600;

    return SectionContainer(
      sectionId: AppConstants.contactId,
      backgroundColor: AppTheme.midnightNavy,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Get In Touch',
            subtitle: "Let's connect and build something great together!",
            titleColor: Colors.white,
            subtitleColor: AppTheme.softCyan,
          ),
          const SizedBox(height: 48),
          // Contact Links Container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                // Contact Links Grid
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: _contacts.map((contact) {
                    return _buildContactLink(context, contact);
                  }).toList(),
                ),
                const SizedBox(height: 32),
                // Divider
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        AppTheme.electricIndigo.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Email Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.electricIndigo.withOpacity(0.2),
                        AppTheme.softCyan.withOpacity(0.1),
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
                  child: (isMobile)
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
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
                                  child: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'tejaswinidev24@gmail.com',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => _handleContactTap(_contacts.first),
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
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
                                        color: AppTheme.electricIndigo
                                            .withOpacity(0.3),
                                        blurRadius: 8,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Send Email',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
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
                              child: const Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'tejaswinidev24@gmail.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                            ),
                            const SizedBox(width: 16),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => _handleContactTap(_contacts.first),
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
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
                                        color: AppTheme.electricIndigo
                                            .withOpacity(0.3),
                                        blurRadius: 8,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Send Email',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactLink(BuildContext context, Contact contact) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _handleContactTap(contact),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
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
                child: Icon(
                  contact.icon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                contact.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500)).scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          curve: Curves.easeOut,
        );
  }

  Future<void> _handleContactTap(Contact contact) async {
    final Uri uri;
    switch (contact.type) {
      case ContactType.email:
        uri = Uri.parse('mailto:${contact.value}');
        break;
      case ContactType.linkedin:
        uri = Uri.parse('https://linkedin.com/in/${contact.value}');
        break;
      case ContactType.github:
        uri = Uri.parse('https://github.com/${contact.value}');
        break;
      case ContactType.medium:
        uri = Uri.parse('https://medium.com/@${contact.value}');
        break;
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  final List<Contact> _contacts = [
    Contact(
      title: 'LinkedIn',
      value: 'tejaswini-d-3a71a7181',
      icon: Icons.work,
      type: ContactType.linkedin,
    ),
    Contact(
      title: 'GitHub',
      value: 'tejaswini-dev-techie',
      icon: Icons.code,
      type: ContactType.github,
    ),
    Contact(
      title: 'Medium',
      value: 'dtejaswini.06',
      icon: Icons.article,
      type: ContactType.medium,
    ),
  ];
}

class Contact {
  final String title;
  final String value;
  final IconData icon;
  final ContactType type;
  final String? certificateUrl;

  Contact({
    required this.title,
    required this.value,
    required this.icon,
    required this.type,
    this.certificateUrl,
  });
}

enum ContactType {
  email,
  linkedin,
  github,
  medium,
}
