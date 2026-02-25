import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page_banner.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_title.dart';

class CareersPage extends StatefulWidget {
  const CareersPage({super.key});

  @override
  State<CareersPage> createState() => _CareersPageState();
}

class _CareersPageState extends State<CareersPage> {
  final _sectionKeys = <String, GlobalKey>{
    'senior-flutter-developer': GlobalKey(),
    'devops-engineer': GlobalKey(),
    'qa-automation-lead': GlobalKey(),
    'technical-project-manager': GlobalKey(),
  };

  String? _lastSection;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final section = GoRouterState.of(context).uri.queryParameters['section'];
    if (section == null || section == _lastSection) {
      return;
    }
    _lastSection = section;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _sectionKeys[section];
      if (key?.currentContext != null) {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageBanner(
          title: 'Careers',
          subtitle:
              'Build meaningful technology with collaborative teams, strong mentorship, and impactful projects.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'Join Our Team',
                    subtitle:
                        'We are hiring engineers, QA specialists, UI architects, and delivery leaders across locations.',
                  ),
                  const SizedBox(height: 28),
                  ResponsiveGrid(
                    minItemWidth: 260,
                    children: [
                      _JobCard(
                        key: _sectionKeys['senior-flutter-developer'],
                        title: 'Senior Flutter Developer',
                        location: 'Remote - US/India',
                      ),
                      _JobCard(
                        key: _sectionKeys['devops-engineer'],
                        title: 'DevOps Engineer',
                        location: 'Hybrid - Austin, TX',
                      ),
                      _JobCard(
                        key: _sectionKeys['qa-automation-lead'],
                        title: 'QA Automation Lead',
                        location: 'Remote - North America',
                      ),
                      _JobCard(
                        key: _sectionKeys['technical-project-manager'],
                        title: 'Technical Project Manager',
                        location: 'Hybrid - New York, NY',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _JobCard extends StatelessWidget {
  const _JobCard({super.key, required this.title, required this.location});

  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A112B4C),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(location, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 12),
          const Text(
            'Apply now',
            style: TextStyle(
              color: Color(0xFFFF8A1E),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
