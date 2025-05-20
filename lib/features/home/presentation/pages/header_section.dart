import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' show Random;
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import 'dart:math' as math;

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<FloatingIcon> _floatingIcons = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Initialize floating icons
    _initializeFloatingIcons();
  }

  void _initializeFloatingIcons() {
    final icons = [
      {'icon': '⚡', 'label': 'FastAPI'},
      {'icon': '📱', 'label': 'Flutter'},
      {'icon': '🔒', 'label': 'Security'},
      {'icon': '🚀', 'label': 'Performance'},
      {'icon': '💻', 'label': 'Full Stack'},
      {'icon': '📊', 'label': 'Scalable'},
    ];

    for (var i = 0; i < icons.length; i++) {
      _floatingIcons.add(
        FloatingIcon(
          icon: icons[i]['icon']!,
          label: icons[i]['label']!,
          startX: _random.nextDouble() * 0.8 + 0.1,
          startY: _random.nextDouble() * 0.8 + 0.1,
          duration: Duration(seconds: 10 + _random.nextInt(10)),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            AppTheme.midnightNavy,
            AppTheme.surface,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated background elements
          ..._floatingIcons.map((icon) => _buildFloatingIcon(icon)),

          // Main content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24.0 : 48.0,
                  vertical: 48.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    // Profile section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!isMobile) ...[
                          _buildProfileImage(),
                          const SizedBox(width: 48),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '✨ Crafting Digital Excellence',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: AppTheme.electricIndigo,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tejaswini D',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      color: AppTheme.textPrimary,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1,
                                      letterSpacing: -1,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppTheme.electricIndigo.withOpacity(0.1),
                                      AppTheme.softCyan.withOpacity(0.1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: AppTheme.electricIndigo
                                        .withOpacity(0.2),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Full Stack Developer',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: AppTheme.electricIndigo,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text('🚀',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppTheme.textSecondary,
                                        height: 1.6,
                                      ),
                                  children: const [
                                    TextSpan(
                                      text: 'Transforming ',
                                    ),
                                    TextSpan(
                                      text: 'complex challenges',
                                      style: TextStyle(
                                        color: AppTheme.electricIndigo,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' into ',
                                    ),
                                    TextSpan(
                                      text: 'elegant solutions',
                                      style: TextStyle(
                                        color: AppTheme.electricIndigo,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '. I architect and develop high-performance applications that scale seamlessly, combining Flutter\'s cross-platform capabilities with Python\'s robust backend solutions. Let\'s build something extraordinary together.',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              // CTA Buttons
                              Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: [
                                  CustomButton(
                                    text: 'View Projects',
                                    onPressed: () {
                                      // Scroll to projects section
                                      Scrollable.ensureVisible(
                                        context,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                  ),
                                  CustomButton(
                                    text: 'Let\'s Connect',
                                    onPressed: () {
                                      // Scroll to contact section
                                      Scrollable.ensureVisible(
                                        context,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              // Social Links
                              Row(
                                children: [
                                  _buildSocialLink(
                                    'https://github.com/yourusername',
                                    Icons.code,
                                  ),
                                  const SizedBox(width: 16),
                                  _buildSocialLink(
                                    'https://linkedin.com/in/yourusername',
                                    Icons.work,
                                  ),
                                  const SizedBox(width: 16),
                                  _buildSocialLink(
                                    'mailto:your.email@example.com',
                                    Icons.email,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    // Scroll indicator
                    if (!isMobile)
                      Column(
                        children: [
                          Text(
                            'Scroll to explore',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppTheme.textSecondary,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppTheme.electricIndigo,
                            size: 32,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppTheme.electricIndigo.withOpacity(0.3),
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.electricIndigo.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Image.asset(
          'assets/images/profile.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSocialLink(String url, IconData icon) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.surface.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.electricIndigo.withOpacity(0.2),
          ),
        ),
        child: Icon(
          icon,
          color: AppTheme.electricIndigo,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildFloatingIcon(FloatingIcon floatingIcon) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        final x = floatingIcon.startX + math.sin(value * 2 * math.pi) * 0.1;
        final y = floatingIcon.startY + math.cos(value * 2 * math.pi) * 0.1;

        return Positioned(
          left: x * MediaQuery.of(context).size.width,
          top: y * MediaQuery.of(context).size.height,
          child: Opacity(
            opacity: 0.1,
            child: Column(
              children: [
                Text(
                  floatingIcon.icon,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 4),
                Text(
                  floatingIcon.label,
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FloatingIcon {
  final String icon;
  final String label;
  final double startX;
  final double startY;
  final Duration duration;

  FloatingIcon({
    required this.icon,
    required this.label,
    required this.startX,
    required this.startY,
    required this.duration,
  });
}
