import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page_banner.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_title.dart';

class TechnologiesPage extends StatefulWidget {
  const TechnologiesPage({super.key});

  @override
  State<TechnologiesPage> createState() => _TechnologiesPageState();
}

class _TechnologiesPageState extends State<TechnologiesPage> {
  final _sectionKeys = <String, GlobalKey>{
    'flutter-web': GlobalKey(),
    'cloud': GlobalKey(),
    'data': GlobalKey(),
    'ai': GlobalKey(),
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
          title: 'Technologies',
          subtitle:
              'Modern stacks and platforms that support cloud-native products at enterprise scale.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'Technology Ecosystem',
                    subtitle:
                        'Our teams work across proven frameworks and tools to accelerate solution delivery.',
                  ),
                  const SizedBox(height: 28),
                  ResponsiveGrid(
                    minItemWidth: 220,
                    children: [
                      _TechCard(
                        key: _sectionKeys['flutter-web'],
                        icon: Icons.web,
                        title: 'Flutter & Web',
                        description:
                            'Cross-platform UI engineering for high-performance web experiences.',
                      ),
                      _TechCard(
                        key: _sectionKeys['cloud'],
                        icon: Icons.cloud_queue,
                        title: 'AWS / Azure / GCP',
                        description:
                            'Cloud-native architectures for scalable, secure, and reliable systems.',
                      ),
                      _TechCard(
                        key: _sectionKeys['data'],
                        icon: Icons.storage_rounded,
                        title: 'PostgreSQL / MongoDB',
                        description:
                            'Data storage strategies tuned for transactional and analytics workloads.',
                      ),
                      _TechCard(
                        key: _sectionKeys['ai'],
                        icon: Icons.smart_toy_rounded,
                        title: 'AI Tooling',
                        description:
                            'Practical AI integrations for automation, insights, and decision support.',
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

class _TechCard extends StatelessWidget {
  const _TechCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A112C4D),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: const Color(0xFF0E2A47)),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF0E2A47),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(height: 1.5, color: Color(0xFF3E5368)),
          ),
        ],
      ),
    );
  }
}
