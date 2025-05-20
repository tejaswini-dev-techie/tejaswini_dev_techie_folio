import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
      title: 'Backend & APIs',
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
      title: 'Data & ML',
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
      title: 'Tools & Platforms',
      icon: '🛠️',
      skills: [
        Skill(name: 'Git', level: 5, description: 'Version control system'),
        Skill(
            name: 'GitHub',
            level: 5,
            description: 'Code collaboration platform'),
        Skill(name: 'Firebase', level: 4, description: 'Backend as a Service'),
        Skill(name: 'AWS', level: 3, description: 'Cloud computing platform'),
        Skill(name: 'JIRA', level: 4, description: 'Project management'),
        Skill(
            name: 'Android Studio',
            level: 4,
            description: 'Android development IDE'),
        Skill(name: 'Cursor', level: 4, description: 'AI-powered code editor'),
        Skill(name: 'Jupyter', level: 4, description: 'Interactive computing'),
        Skill(name: 'Figma', level: 3, description: 'UI/UX design tool'),
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
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);

    return SectionContainer(
      sectionId: AppConstants.skillsId,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Skills & Expertise',
            subtitle: 'Technologies I work with',
          ),
          const SizedBox(height: 32),
          // Search and View Toggle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => setState(() => _searchQuery = value),
                    decoration: InputDecoration(
                      hintText: 'Search skills...',
                      prefixIcon: const Icon(Icons.search),
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
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ToggleButtons(
                  isSelected: [_showByCategory, !_showByCategory],
                  onPressed: (index) {
                    setState(() => _showByCategory = index == 0);
                  },
                  borderRadius: BorderRadius.circular(12),
                  selectedColor: AppTheme.electricIndigo,
                  fillColor: AppTheme.electricIndigo.withOpacity(0.1),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('By Category'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Alphabetical'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return _buildCategoryCard(category);
      },
    );
  }

  Widget _buildAlphabeticalGrid(bool isMobile) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        childAspectRatio: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemCount: _filteredSkills.length,
      itemBuilder: (context, index) {
        final skill = _filteredSkills[index];
        return _buildSkillCard(skill);
      },
    );
  }

  Widget _buildCategoryCard(SkillCategory category) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.electricIndigo.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                category.icon,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: category.skills.length,
              itemBuilder: (context, index) {
                final skill = category.skills[index];
                return _buildSkillItem(skill);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(Skill skill) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.electricIndigo.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  skill.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (skill.level >= 4)
                const Text('🔥', style: TextStyle(fontSize: 20)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            skill.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: 16,
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

  Widget _buildSkillItem(Skill skill) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  skill.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  skill.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: 16,
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
