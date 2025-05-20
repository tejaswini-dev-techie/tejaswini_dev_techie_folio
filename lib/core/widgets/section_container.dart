import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../utils/responsive_utils.dart';

class SectionContainer extends StatelessWidget {
  final String sectionId;
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool animate;

  const SectionContainer({
    super.key,
    required this.sectionId,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(sectionId),
      width: double.infinity,
      padding: padding ?? ResponsiveUtils.getScreenPadding(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.midnightNavy,
      ),
      child: animate
          ? child
              .animate()
              .fadeIn(duration: const Duration(milliseconds: 500))
              .slideY(begin: 0.1, end: 0)
          : child,
    );
  }
}

class SectionContent extends StatelessWidget {
  final Widget child;
  final bool isCentered;
  final EdgeInsets? padding;

  const SectionContent({
    super.key,
    required this.child,
    this.isCentered = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtils.getContainerWidth(context),
      padding: padding,
      child: isCentered
          ? Center(
              child: child,
            )
          : child,
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing = 24,
    this.runSpacing = 24,
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
 