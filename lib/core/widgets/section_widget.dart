import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/app_config.dart';
import '../theme/app_theme.dart';
import '../utils/responsive_utils.dart';
import 'section_container.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool animate;
  final bool isCentered;
  final bool showDivider;
  final Widget? trailing;

  const SectionWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.animate = true,
    this.isCentered = true,
    this.showDivider = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionId: title.toLowerCase().replaceAll(' ', '_'),
      backgroundColor: backgroundColor,
      padding: padding,
      animate: animate,
      child: Column(
        crossAxisAlignment:
            isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          if (showDivider) ...[
            const SizedBox(height: AppConfig.defaultSpacing),
            _buildDivider(context),
          ],
          const SizedBox(height: AppConfig.largeSpacing),
          child,
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: ResponsiveUtils.getFontSize(
                  context,
                  desktop: 36,
                  tablet: 32,
                  mobile: 28,
                ),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: AppConfig.smallSpacing),
              trailing!,
            ],
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppConfig.smallSpacing),
          Text(
            subtitle!,
            style: AppTheme.bodyStyle.copyWith(
              fontSize: ResponsiveUtils.getFontSize(
                context,
                desktop: 18,
                tablet: 16,
                mobile: 14,
              ),
            ),
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
          ),
        ],
      ],
    )
        .animate()
        .fadeIn(duration: AppConfig.sectionAnimationDuration)
        .slideY(begin: 0.1, end: 0);
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      width: ResponsiveUtils.isMobile(context) ? 40 : 60,
      height: 4,
      decoration: BoxDecoration(
        gradient: AppConfig.accentGradient,
        borderRadius: BorderRadius.circular(2),
      ),
    ).animate().scaleX(
          duration: AppConfig.sectionAnimationDuration,
          curve: Curves.easeOutCubic,
        );
  }
}

class SectionGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const SectionGrid({
    super.key,
    required this.children,
    this.spacing = AppConfig.defaultSpacing,
    this.runSpacing = AppConfig.defaultSpacing,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = ResponsiveUtils.getGridCrossAxisCount(context);
        final itemWidth =
            (constraints.maxWidth - (spacing * (crossAxisCount - 1))) /
                crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          alignment: WrapAlignment.center,
          children: children.map((child) {
            return SizedBox(
              width: itemWidth,
              child: child,
            );
          }).toList(),
        );
      },
    );
  }
}
