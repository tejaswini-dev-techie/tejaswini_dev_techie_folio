import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final ScrollController _scrollController = ScrollController();

  // void _scrollToSection(String sectionId) {
  //   final key = SectionKeysProvider.getKey(sectionId);
  //   if (key.currentContext == null) return;

  //   final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
  //   if (box == null) return;

  //   final ScrollableState? scrollable = Scrollable.maybeOf(context);
  //   if (scrollable == null) return;

  //   final targetPosition = box.localToGlobal(Offset.zero);
  //   final currentPosition = (context.findRenderObject() as RenderBox?)
  //           ?.localToGlobal(Offset.zero) ??
  //       Offset.zero;
  //   final offset = targetPosition.dy - currentPosition.dy;

  //   scrollable.position.animateTo(
  //     scrollable.position.pixels + offset,
  //     duration: const Duration(milliseconds: 800),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);
    // final isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, TABLET);

    return SectionContainer(
      key: GlobalKey(),
      sectionId: AppConstants.heroId,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.heroLinearGradient,
        ),
        child: Stack(
          children: [
            // Background Elements
            Positioned(
              right: isMobile ? -50 : -100,
              top: isMobile ? -50 : -100,
              child: Container(
                width: isMobile ? 150 : 300,
                height: isMobile ? 150 : 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.electricIndigo.withOpacity(0.2),
                      AppTheme.electricIndigo.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: isMobile ? -25 : -50,
              bottom: isMobile ? -25 : -50,
              child: Container(
                width: isMobile ? 100 : 200,
                height: isMobile ? 100 : 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.softCyan.withOpacity(0.2),
                      AppTheme.softCyan.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            // Developer Icon - Hide on mobile
            if (!isMobile)
              Positioned(
                right: 140,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    width: 210,
                    height: 210,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFF6B46C1).withOpacity(0.15),
                          const Color(0xFF4299E1).withOpacity(0.15),
                        ],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6B46C1).withOpacity(0.1),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.developer_mode_rounded,
                        size: 120,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: const Duration(milliseconds: 800))
                      .scale(
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1, 1),
                        curve: Curves.easeOut,
                      ),
                ),
              ),
            // Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isMobile ? 80 : 120),
                  Text(
                    'Hi, I\'m Tejaswini Dev',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 20 : 24,
                      color: AppTheme.softCyan,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(duration: AppTheme.mediumAnimation),
                  SizedBox(height: isMobile ? 12 : 16),
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppTheme.primaryLinearGradient.createShader(bounds),
                    child: Text(
                      'Full Stack Engineer',
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 40 : 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                        letterSpacing: -1,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: AppTheme.longAnimation)
                      .slideY(begin: 0.3, end: 0),
                  SizedBox(height: isMobile ? 16 : 24),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 600,
                    ),
                    child: Text(
                      'Crafting scalable digital solutions that drive business growth. Expert in building high-performance applications with Flutter and Python FastAPI, delivering seamless user experiences across platforms.',
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 16 : 20,
                        color: AppTheme.textSecondary,
                        height: 1.6,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: AppTheme.longAnimation)
                      .slideY(begin: 0.3, end: 0),
                  SizedBox(height: isMobile ? 32 : 40),
                  // Download Resume Button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _handleResumeDownload(),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 20 : 24,
                          vertical: isMobile ? 12 : 14,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF6B46C1), // Deep Purple
                              Color(0xFF4299E1), // Bright Blue
                            ],
                            stops: [0.0, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6B46C1).withOpacity(0.25),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(isMobile ? 5 : 6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Icon(
                                Icons.download_rounded,
                                color: Colors.white,
                                size: isMobile ? 18 : 20,
                              ),
                            ),
                            SizedBox(width: isMobile ? 10 : 12),
                            Text(
                              'Resume',
                              style: GoogleFonts.poppins(
                                fontSize: isMobile ? 14 : 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: AppTheme.longAnimation)
                      .slideY(begin: 0.3, end: 0),
                  SizedBox(height: isMobile ? 60 : 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleResumeDownload() async {
    const resumeUrl =
        'https://docs.google.com/document/d/1uYdvkveWcBGY66fCGOjClqekFd0CIaONxh__XPWGiWo/edit?usp=sharing';
    final uri = Uri.parse(resumeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
