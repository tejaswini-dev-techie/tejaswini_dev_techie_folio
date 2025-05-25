import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/custom_nav_bar.dart';
import '../../features/about/presentation/pages/about_section.dart';
import '../../features/certifications/presentation/pages/certifications_section.dart';
import '../../features/contact/presentation/pages/contact_section.dart';
import '../../features/education/presentation/pages/education_section.dart';
import '../../features/experience/presentation/pages/experience_section.dart';
import '../../features/hero/presentation/pages/hero_section.dart';
import '../../features/projects/presentation/pages/projects_section.dart';
import '../../features/skills/presentation/pages/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _positionsListener =
      ItemPositionsListener.create();
  int _selectedIndex = 0;
  bool _isScrolling = false;

  final List<Widget> _sections = [
    const HeroSection(),
    const AboutSection(),
    const SkillsSection(),
    ExperienceSection(),
    ProjectsSection(),
    EducationSection(),
    CertificationsSection(),
    ContactSection(),
  ];

  @override
  void initState() {
    super.initState();
    _positionsListener.itemPositions.addListener(_onScroll);
  }

  @override
  void dispose() {
    _positionsListener.itemPositions.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_isScrolling) return;

    final positions = _positionsListener.itemPositions.value;
    if (positions.isEmpty) return;

    // Find the first visible section
    final firstVisible = positions.first;
    final index = firstVisible.index;
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _scrollToSection(int index) {
    setState(() {
      _isScrolling = true;
    });

    _scrollController
        .scrollTo(
      index: index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    )
        .then((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _isScrolling = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.midnightNavy,
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: _sections.length,
            itemScrollController: _scrollController,
            itemPositionsListener: _positionsListener,
            itemBuilder: (context, index) => _sections[index]
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 500))
                .slideY(begin: 0.1, end: 0),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavBar(
              selectedIndex: _selectedIndex,
              onItemSelected: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}
