import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final LinearGradient? gradient;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double height;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool isLoading;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.gradient,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.borderRadius = 12,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                isOutlined ? AppTheme.electricIndigo : AppTheme.softWhite,
              ),
            ),
          )
        else ...[
          if (icon != null) ...[
            Icon(
              icon,
              size: 20,
              color: isOutlined ? AppTheme.electricIndigo : AppTheme.softWhite,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(
              color: isOutlined ? AppTheme.electricIndigo : AppTheme.softWhite,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ],
    );

    if (isOutlined) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: textColor ?? AppTheme.electricIndigo,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(
              color: gradient != null
                  ? Colors.transparent
                  : AppTheme.electricIndigo,
              width: 2,
            ),
          ),
          child: buttonContent,
        ),
      ).animate().scale(
            duration: AppTheme.shortAnimation,
            curve: Curves.easeOut,
          );
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient ?? AppTheme.primaryLinearGradient,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: (gradient?.colors.first ?? AppTheme.electricIndigo)
                .withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: textColor ?? AppTheme.softWhite,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: buttonContent,
      ),
    ).animate().scale(
          duration: AppTheme.shortAnimation,
          curve: Curves.easeOut,
        );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String tooltip;

  const SocialButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Implement URL launcher
          },
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                icon,
                color: AppTheme.electricIndigo,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    )
        .animate()
        .scale(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        )
        .then()
        .shimmer(
          duration: const Duration(milliseconds: 1500),
          color: AppTheme.electricIndigo.withOpacity(0.2),
        );
  }
}
 