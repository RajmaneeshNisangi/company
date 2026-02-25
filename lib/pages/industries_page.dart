import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page_banner.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_title.dart';

class IndustriesPage extends StatefulWidget {
  const IndustriesPage({super.key});

  @override
  State<IndustriesPage> createState() => _IndustriesPageState();
}

class _IndustriesPageState extends State<IndustriesPage> {
  final _sectionKeys = <String, GlobalKey>{
    'healthcare': GlobalKey(),
    'fintech': GlobalKey(),
    'retail': GlobalKey(),
    'logistics': GlobalKey(),
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
          title: 'Industries',
          subtitle:
              'Domain-focused delivery expertise tailored to highly regulated and fast-moving markets.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'Vertical Expertise',
                    subtitle:
                        'We build practical solutions for complex operational and customer-facing environments.',
                  ),
                  const SizedBox(height: 28),
                  ResponsiveGrid(
                    minItemWidth: 260,
                    children: [
                      _IndustryCard(
                        key: _sectionKeys['healthcare'],
                        title: 'Healthcare',
                        text:
                            'HIPAA-aware digital systems and patient-centric apps.',
                      ),
                      _IndustryCard(
                        key: _sectionKeys['fintech'],
                        title: 'Fintech',
                        text:
                            'Secure, scalable platforms for payments and financial products.',
                      ),
                      _IndustryCard(
                        key: _sectionKeys['retail'],
                        title: 'Retail',
                        text:
                            'Omnichannel commerce and data-driven customer engagement.',
                      ),
                      _IndustryCard(
                        key: _sectionKeys['logistics'],
                        title: 'Logistics',
                        text:
                            'Automation and visibility for distributed supply operations.',
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

class _IndustryCard extends StatelessWidget {
  const _IndustryCard({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
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
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(text, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
