import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';
import '../utils/responsive_utils.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getScreenPadding(context).horizontal,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppTheme.midnightNavy.withOpacity(0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: isMobile
          ? _buildMobileNav(context)
          : isTablet
              ? _buildTabletNav(context)
              : _buildDesktopNav(context),
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tejaswini Dev',
          style: GoogleFonts.inter(
            fontSize: 24,
            color: AppTheme.electricIndigo,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: AppTheme.softWhite),
          onPressed: () {
            _showMobileMenu(context);
          },
        ),
      ],
    );
  }

  Widget _buildTabletNav(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tejaswini Dev',
              style: GoogleFonts.inter(
                fontSize: 24,
                color: AppTheme.electricIndigo,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.softWhite),
              onPressed: () {
                _showMobileMenu(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tejaswini Dev',
          style: GoogleFonts.inter(
            fontSize: 28,
            color: AppTheme.electricIndigo,
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildNavItems(context),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItems(BuildContext context, {bool isTablet = false}) {
    final navItems = [
      'Home',
      'About',
      'Skills',
      'Experience',
      'Projects',
      'Education',
      'Certifications',
      'Contact',
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        navItems.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 8 : 16,
          ),
          child: _NavItem(
            title: navItems[index],
            isSelected: selectedIndex == index,
            onTap: () => onItemSelected(index),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.midnightNavy,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              8,
              (index) => ListTile(
                title: Text(
                  [
                    'Home',
                    'About',
                    'Skills',
                    'Experience',
                    'Projects',
                    'Education',
                    'Certifications',
                    'Contact'
                  ][index],
                  style: TextStyle(
                    color: selectedIndex == index
                        ? AppTheme.electricIndigo
                        : AppTheme.softWhite,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onItemSelected(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.electricIndigo.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppTheme.electricIndigo : AppTheme.softWhite,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
