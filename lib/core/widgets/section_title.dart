import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final TextAlign? textAlign;
  final bool showDivider;
  final bool isMobile;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.titleColor,
    this.subtitleColor,
    this.textAlign,
    this.showDivider = true,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subtitle != null) ...[
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppTheme.accentLinearGradient.createShader(bounds),
              child: Text(
                subtitle!,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: subtitleColor ?? AppTheme.softCyan,
                  letterSpacing: 0.5,
                ),
                textAlign: textAlign ?? TextAlign.center,
                overflow: TextOverflow.visible,
              ),
            ).animate().fadeIn(duration: AppTheme.mediumAnimation),
            const SizedBox(height: 16),
          ],
          ShaderMask(
            shaderCallback: (bounds) =>
                AppTheme.primaryLinearGradient.createShader(bounds),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: titleColor ?? AppTheme.textPrimary,
                height: 1.2,
                letterSpacing: -0.5,
              ),
              textAlign: textAlign ?? TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          )
              .animate()
              .fadeIn(duration: AppTheme.longAnimation)
              .slideY(begin: 0.3, end: 0),
          if (showDivider) ...[
            const SizedBox(height: 24),
            Container(
              height: 2,
              width: 60,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryLinearGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ).animate().scaleX(
                  duration: AppTheme.longAnimation,
                  curve: Curves.easeOut,
                ),
          ],
        ],
      ),
    );
  }
}
