import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page_banner.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_title.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  final _sectionKeys = <String, GlobalKey>{
    'cloud-migration': GlobalKey(),
    'scaling-flutter': GlobalKey(),
    'high-velocity-teams': GlobalKey(),
    'ai-readiness': GlobalKey(),
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
          title: 'Resources',
          subtitle:
              'Insights, playbooks, and practical guides from our engineering and consulting teams.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'Latest Insights',
                    subtitle:
                        'Browse practical articles and guides for digital delivery, architecture, and team scaling.',
                  ),
                  const SizedBox(height: 28),
                  ResponsiveGrid(
                    minItemWidth: 300,
                    children: [
                      _ResourceCard(
                        key: _sectionKeys['cloud-migration'],
                        title: 'Cloud Migration Checklist',
                        type: 'Guide',
                      ),
                      _ResourceCard(
                        key: _sectionKeys['scaling-flutter'],
                        title: 'Scaling Flutter for Enterprise',
                        type: 'Article',
                      ),
                      _ResourceCard(
                        key: _sectionKeys['high-velocity-teams'],
                        title: 'Building High-Velocity Teams',
                        type: 'Playbook',
                      ),
                      _ResourceCard(
                        key: _sectionKeys['ai-readiness'],
                        title: 'AI Readiness Assessment',
                        type: 'Toolkit',
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

class _ResourceCard extends StatelessWidget {
  const _ResourceCard({super.key, required this.title, required this.type});

  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A123055),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE0C5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(type, style: const TextStyle(color: Color(0xFFC05E00))),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF0E2A47),
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Read practical implementation patterns from our consultants and engineers.',
            style: TextStyle(height: 1.6),
          ),
        ],
      ),
    );
  }
}
