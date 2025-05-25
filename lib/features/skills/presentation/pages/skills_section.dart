import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/section_title.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _showByCategory = true;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<SkillCategory> _categories = [
    SkillCategory(
      title: 'Mobile App Development',
      icon: '📱',
      skills: [
        Skill(
            name: 'Flutter',
            level: 5,
            description: 'UI toolkit for building natively compiled apps'),
        Skill(
            name: 'Dart',
            level: 5,
            description: 'Client-optimized language for fast apps'),
        Skill(
            name: 'Android',
            level: 4,
            description: 'Native Android development'),
        Skill(
            name: 'Kotlin',
            level: 4,
            description: 'Modern Android development language'),
      ],
    ),
    SkillCategory(
      title: 'Frontend Development',
      icon: '🎨',
      skills: [
        Skill(
            name: 'HTML5',
            level: 4,
            description: 'Semantic markup and modern web structure'),
        Skill(
            name: 'CSS3',
            level: 4,
            description: 'Advanced styling and animations'),
        Skill(
            name: 'JavaScript',
            level: 4,
            description: 'Dynamic web interactions'),
        Skill(
            name: 'Bootstrap',
            level: 4,
            description: 'Responsive frontend framework'),
        Skill(name: 'SASS', level: 3, description: 'Advanced CSS preprocessor'),
      ],
    ),
    SkillCategory(
      title: 'Backend Development',
      icon: '⚙️',
      skills: [
        Skill(
            name: 'Python',
            level: 5,
            description: 'Versatile programming language'),
        Skill(
            name: 'FastAPI',
            level: 5,
            description: 'Modern, fast web framework'),
        Skill(
            name: 'Flask',
            level: 4,
            description: 'Lightweight Python web framework'),
        Skill(
            name: 'Java',
            level: 3,
            description: 'Enterprise-grade backend development'),
      ],
    ),
    SkillCategory(
      title: 'Data Science & Analytics',
      icon: '📊',
      skills: [
        Skill(
            name: 'Pandas',
            level: 4,
            description: 'Data manipulation and analysis'),
        Skill(name: 'NumPy', level: 4, description: 'Scientific computing'),
        Skill(
            name: 'Scikit-learn',
            level: 3,
            description: 'Machine learning library'),
        Skill(name: 'Matplotlib', level: 4, description: 'Data visualization'),
        Skill(
            name: 'Seaborn',
            level: 3,
            description: 'Statistical data visualization'),
      ],
    ),
    SkillCategory(
      title: 'Database',
      icon: '🗄️',
      skills: [
        Skill(
            name: 'SQL',
            level: 4,
            description: 'Relational database management'),
        Skill(name: 'MongoDB', level: 4, description: 'NoSQL database'),
      ],
    ),
    SkillCategory(
      title: 'Version Control',
      icon: '🛠️',
      skills: [
        Skill(name: 'Git', level: 5, description: 'Version control system'),
        Skill(
            name: 'GitHub',
            level: 5,
            description: 'Code collaboration platform'),
      ],
    ),
    SkillCategory(
      title: 'Cloud & Backend Services',
      icon: '🛠️',
      skills: [
        Skill(name: 'Firebase', level: 4, description: 'Backend as a Service'),
        Skill(name: 'AWS', level: 3, description: 'Cloud computing platform'),
        Skill(
            name: 'Cloud Firestore',
            level: 4,
            description: 'Firebase NoSQL database'),
        Skill(
            name: 'Push Notifications',
            level: 4,
            description: 'Notification service'),
        Skill(
            name: 'Cloud Functions',
            level: 4,
            description: 'Cloud function service'),
        Skill(name: 'Analytics', level: 4, description: 'Analytics service'),
        Skill(
            name: 'Dynamic Links',
            level: 4,
            description: 'Dynamic link service'),
      ],
    ),
    SkillCategory(
      title: 'Tools & Platforms',
      icon: '🛠️',
      skills: [
        Skill(name: 'JIRA', level: 5, description: 'Project management'),
        Skill(
            name: 'Android Studio',
            level: 5,
            description: 'Android development IDE'),
        Skill(
            name: 'Cursor IDE',
            level: 4,
            description: 'AI-powered code editor'),
        Skill(name: 'Jupyter', level: 5, description: 'Interactive computing'),
        Skill(name: 'Figma', level: 5, description: 'UI/UX design tool'),
      ],
    ),
  ];

  List<Skill> get _allSkills {
    return _categories.expand((category) => category.skills).toList();
  }

  List<Skill> get _filteredSkills {
    final skills = _showByCategory ? _allSkills : _allSkills
      ..sort((a, b) => a.name.compareTo(b.name));
    if (_searchQuery.isEmpty) return skills;
    return skills
        .where((skill) =>
            skill.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            skill.description
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);
    // final isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, TABLET);
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;

    // Consider screens smaller than 600 as mobile
    final isMobile = screenWidth < 600;

    return SectionContainer(
      sectionId: AppConstants.skillsId,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Skills & Expertise',
            subtitle: 'Technologies I work with',
          ),
          SizedBox(height: isMobile ? 24 : 32),
          // Search and View Toggle
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (value) => setState(() => _searchQuery = value),
                  decoration: InputDecoration(
                    hintText: 'Search skills...',
                    prefixIcon: Icon(
                      Icons.search,
                      size: isMobile ? 20 : 24,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppTheme.electricIndigo.withOpacity(0.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppTheme.electricIndigo.withOpacity(0.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppTheme.electricIndigo,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 12 : 16,
                      vertical: isMobile ? 12 : 16,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 12 : 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ToggleButtons(
                    isSelected: [_showByCategory, !_showByCategory],
                    onPressed: (index) {
                      setState(() => _showByCategory = index == 0);
                    },
                    borderRadius: BorderRadius.circular(12),
                    selectedColor: AppTheme.electricIndigo,
                    fillColor: AppTheme.electricIndigo.withOpacity(0.1),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 12 : 16,
                          vertical: isMobile ? 8 : 12,
                        ),
                        child: Text(
                          'By Category',
                          style: TextStyle(
                            fontSize: isMobile ? 13 : 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 12 : 16,
                          vertical: isMobile ? 8 : 12,
                        ),
                        child: Text(
                          'Alphabetical',
                          style: TextStyle(
                            fontSize: isMobile ? 13 : 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 24 : 32),
          // Skills Grid
          if (_showByCategory)
            _buildCategoryGrid(isMobile)
          else
            _buildAlphabeticalGrid(isMobile),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(bool isMobile) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        childAspectRatio: isMobile ? 0.85 : 1.15,
        crossAxisSpacing: isMobile ? 16 : 24,
        mainAxisSpacing: isMobile ? 16 : 24,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return _buildCategoryCard(category, isMobile);
      },
    );
  }

  Widget _buildAlphabeticalGrid(bool isMobile) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        childAspectRatio: isMobile ? 4.5 : 2,
        crossAxisSpacing: isMobile ? 16 : 24,
        mainAxisSpacing: isMobile ? 16 : 24,
      ),
      itemCount: _filteredSkills.length,
      itemBuilder: (context, index) {
        final skill = _filteredSkills[index];
        return _buildSkillCard(skill, isMobile);
      },
    );
  }

  Widget _buildCategoryCard(SkillCategory category, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.electricIndigo.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.icon,
                style: TextStyle(fontSize: isMobile ? 24 : 32),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 18 : null,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: category.skills.length,
              itemBuilder: (context, index) {
                final skill = category.skills[index];
                return _buildSkillItem(skill, isMobile);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(Skill skill, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.electricIndigo.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  skill.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 15 : null,
                      ),
                ),
              ),
              if (skill.level >= 4)
                Text('🔥', style: TextStyle(fontSize: isMobile ? 16 : 20)),
            ],
          ),
          SizedBox(height: isMobile ? 6 : 8),
          Text(
            skill.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                  fontSize: isMobile ? 13 : null,
                ),
          ),
          SizedBox(height: isMobile ? 6 : 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: isMobile ? 14 : 16,
                color: index < skill.level
                    ? AppTheme.electricIndigo
                    : AppTheme.textSecondary.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(Skill skill, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 8 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  skill.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: isMobile ? 14 : null,
                      ),
                ),
                SizedBox(height: isMobile ? 2 : 4),
                Text(
                  skill.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: isMobile ? 12 : null,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(width: isMobile ? 8 : 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: isMobile ? 14 : 16,
                color: index < skill.level
                    ? AppTheme.electricIndigo
                    : AppTheme.textSecondary.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCategory {
  final String title;
  final String icon;
  final List<Skill> skills;

  SkillCategory({
    required this.title,
    required this.icon,
    required this.skills,
  });
}

class Skill {
  final String name;
  final int level;
  final String description;

  Skill({
    required this.name,
    required this.level,
    required this.description,
  });
}
