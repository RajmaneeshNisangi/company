import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page_banner.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_title.dart';
import '../widgets/service_card.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final _sectionKeys = <String, GlobalKey>{
    'custom-software-development': GlobalKey(),
    'devops': GlobalKey(),
    'cybersecurity': GlobalKey(),
    'data-engineering': GlobalKey(),
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
          title: 'Services',
          subtitle:
              'Full-lifecycle services that transform ideas into resilient digital products and platforms.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'How We Help',
                    subtitle:
                        'Choose from focused services or integrated delivery squads tailored to your roadmap.',
                  ),
                  const SizedBox(height: 28),
                  ResponsiveGrid(
                    minItemWidth: 250,
                    children: [
                      ServiceCard(
                        key: _sectionKeys['custom-software-development'],
                        icon: Icons.code_rounded,
                        title: 'Custom Software Development',
                        description:
                            'Design and build robust, scalable software tailored to your business priorities.',
                      ),
                      ServiceCard(
                        key: _sectionKeys['devops'],
                        icon: Icons.settings_suggest_rounded,
                        title: 'DevOps Engineering',
                        description:
                            'Streamline CI/CD, observability, and infrastructure automation for faster releases.',
                      ),
                      ServiceCard(
                        key: _sectionKeys['cybersecurity'],
                        icon: Icons.security_rounded,
                        title: 'Cybersecurity Services',
                        description:
                            'Shift-left security, compliance alignment, and proactive risk reduction strategies.',
                      ),
                      ServiceCard(
                        key: _sectionKeys['data-engineering'],
                        icon: Icons.data_object_rounded,
                        title: 'Data Engineering',
                        description:
                            'Build trusted data platforms and analytics pipelines for better decision-making.',
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
