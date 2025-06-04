import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final isMobile = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);
    // final isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, TABLET);
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;

    // Consider screens smaller than 600 as mobile
    final isMobile = screenWidth < 600;

    return SectionContainer(
      sectionId: AppConstants.aboutId,
      child: Column(
        children: [
          const SectionTitle(
            title: 'About Me',
            subtitle: 'Crafting Digital Experiences with Code',
          ),
          SizedBox(height: isMobile ? 24 : 40),
          if (isMobile)
            _buildMobileLayout(context, isMobile)
          else
            _buildDesktopLayout(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isMobile) {
    return Column(
      children: [
        // Professional Bio
        _buildBioSection(context, isMobile),
        SizedBox(height: isMobile ? 24 : 32),
        // Technical Writing Section
        _buildTechnicalWritingSection(context, isMobile),
        SizedBox(height: isMobile ? 24 : 32),
        // Open Source Section
        _buildOpenSourceSection(context, isMobile),
        SizedBox(height: isMobile ? 24 : 32),
        // Key Achievements
        _buildAchievementsSection(context, isMobile),
        SizedBox(height: isMobile ? 24 : 32),
        // Personal Values
        _buildPersonalValuesSection(context, isMobile),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isMobile) {
    return ResponsiveRowColumn(
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      columnMainAxisAlignment: MainAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
          ? ResponsiveRowColumnType.ROW
          : ResponsiveRowColumnType.COLUMN,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 12.0 : 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBioSection(context, isMobile),
                SizedBox(height: isMobile ? 24 : 32),
                _buildTechnicalWritingSection(context, isMobile),
                SizedBox(height: isMobile ? 24 : 32),
                _buildOpenSourceSection(context, isMobile),
              ],
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 12.0 : 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAchievementsSection(context, isMobile),
                SizedBox(height: isMobile ? 24 : 32),
                _buildPersonalValuesSection(context, isMobile),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBioSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.electricIndigo.withOpacity(0.1),
            AppTheme.softCyan.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.electricIndigo.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 8 : 12),
                decoration: BoxDecoration(
                  color: AppTheme.electricIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.code,
                  color: AppTheme.electricIndigo,
                  size: isMobile ? 24 : 32,
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Text(
                  'Full Stack Developer',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.electricIndigo,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 20 : null,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            'As a Full Stack Developer, I specialise in building robust mobile applications and scalable backend systems using Flutter and Python FastAPI. With over 4+ years of experience, I have successfully delivered enterprise-grade solutions that have achieved over 1 crore downloads across various platforms.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.6,
                  fontSize: isMobile ? 14 : null,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechnicalWritingSection(BuildContext context, bool isMobile) {
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 8 : 12),
                decoration: BoxDecoration(
                  color: AppTheme.electricIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.article,
                  color: AppTheme.electricIndigo,
                  size: isMobile ? 24 : 32,
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Text(
                  'Technical Writing',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 20 : null,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            'I actively contribute to the developer community through technical writing on Medium, where I share in-depth articles on Flutter development, backend architecture, and best practices. My articles focus on practical solutions and real-world implementation strategies.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.6,
                  fontSize: isMobile ? 14 : null,
                ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          InkWell(
            onTap: () =>
                launchUrl(Uri.parse('https://medium.com/@dtejaswini.06')),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 6 : 8,
              ),
              decoration: BoxDecoration(
                color: AppTheme.electricIndigo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.electricIndigo.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.article,
                    color: AppTheme.electricIndigo,
                    size: isMobile ? 16 : 20,
                  ),
                  SizedBox(width: isMobile ? 6 : 8),
                  Flexible(
                    child: Text(
                      'Read my articles on Medium',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.electricIndigo,
                            fontWeight: FontWeight.w500,
                            fontSize: isMobile ? 13 : null,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpenSourceSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.electricIndigo.withOpacity(0.1),
            AppTheme.softCyan.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.electricIndigo.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 8 : 12),
                decoration: BoxDecoration(
                  color: AppTheme.electricIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.code,
                  color: AppTheme.electricIndigo,
                  size: isMobile ? 24 : 32,
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Text(
                  'Open Source Contributions',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 20 : null,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            'I am committed to advancing the Flutter ecosystem through open-source contributions. My packages on Pub.dev provide developers with efficient tools for text animations and UI enhancements, demonstrating my dedication to improving developer productivity.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.6,
                  fontSize: isMobile ? 14 : null,
                ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Wrap(
            spacing: isMobile ? 8 : 12,
            runSpacing: isMobile ? 8 : 12,
            children: [
              _buildPackageLink(
                context,
                'Sequential Text Fade',
                'https://pub.dev/packages/sequential_text_fade',
                isMobile,
              ),
              _buildPackageLink(
                context,
                'Read More Expandable Text',
                'https://pub.dev/packages/readmore_expandable_text',
                isMobile,
              ),
              _buildPackageLink(
                context,
                'Adaptive Ticket View',
                'https://pub.dev/packages/adaptive_ticket_view',
                isMobile,
              ),
              _buildPackageLink(
                context,
                'Expandable Content List',
                'https://pub.dev/packages/expandable_content_list',
                isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(BuildContext context, bool isMobile) {
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 8 : 12),
                decoration: BoxDecoration(
                  color: AppTheme.electricIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.emoji_events,
                  color: AppTheme.electricIndigo,
                  size: isMobile ? 24 : 32,
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Text(
                  'Key Achievements',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 20 : null,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 24),
          _buildAchievementItem(
            context,
            '🚀 System Optimization',
            'Implemented advanced caching strategies and query optimization, resulting in a 30% reduction in API response times and improved user experience',
            isMobile,
          ),
          _buildAchievementItem(
            context,
            '⚡ Development Efficiency',
            'Established comprehensive CI/CD pipelines with automated testing, reducing deployment time by 40% and ensuring code quality',
            isMobile,
          ),
          _buildAchievementItem(
            context,
            '📱 Product Impact',
            'Led the development of high-performance applications that have collectively achieved over 1 crore downloads, demonstrating strong market adoption',
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalValuesSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.electricIndigo.withOpacity(0.1),
            AppTheme.softCyan.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.electricIndigo.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 8 : 12),
                decoration: BoxDecoration(
                  color: AppTheme.electricIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.favorite,
                  color: AppTheme.electricIndigo,
                  size: isMobile ? 24 : 32,
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Text(
                  'Personal Values',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 20 : null,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            'I am driven by a passion for creating impactful technological solutions and fostering growth in the developer community. Through mentoring and knowledge sharing, I aim to contribute to the advancement of software development practices while continuously expanding my expertise.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.6,
                  fontSize: isMobile ? 14 : null,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(
    BuildContext context,
    String title,
    String description,
    bool isMobile,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 12.0 : 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(isMobile ? 6 : 8),
            decoration: BoxDecoration(
              color: AppTheme.electricIndigo.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title.split(' ')[0],
              style: TextStyle(fontSize: isMobile ? 16 : 20),
            ),
          ),
          SizedBox(width: isMobile ? 12 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.split(' ').skip(1).join(' '),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                        fontSize: isMobile ? 15 : null,
                      ),
                ),
                SizedBox(height: isMobile ? 2 : 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: isMobile ? 13 : null,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageLink(
    BuildContext context,
    String label,
    String url,
    bool isMobile,
  ) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 16,
          vertical: isMobile ? 6 : 8,
        ),
        decoration: BoxDecoration(
          color: AppTheme.electricIndigo.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.electricIndigo.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.code,
              color: AppTheme.electricIndigo,
              size: isMobile ? 16 : 20,
            ),
            SizedBox(width: isMobile ? 6 : 8),
            Flexible(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.electricIndigo,
                      fontWeight: FontWeight.w500,
                      fontSize: isMobile ? 13 : null,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
