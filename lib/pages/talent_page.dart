import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page_banner.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_title.dart';

class TalentPage extends StatefulWidget {
  const TalentPage({super.key});

  @override
  State<TalentPage> createState() => _TalentPageState();
}

class _TalentPageState extends State<TalentPage> {
  final _sectionKeys = <String, GlobalKey>{
    'staff-augmentation': GlobalKey(),
    'dedicated-teams': GlobalKey(),
    'leadership-hiring': GlobalKey(),
    'flexible-engagements': GlobalKey(),
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
          title: 'Talent Solutions',
          subtitle:
              'Flexible engagement models to help you scale engineering capacity without sacrificing quality.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'Scale Your Team',
                    subtitle:
                        'Build high-performing teams through contract, dedicated squad, or long-term extension models.',
                  ),
                  const SizedBox(height: 28),
                  ResponsiveGrid(
                    minItemWidth: 260,
                    children: [
                      _TalentCard(
                        key: _sectionKeys['staff-augmentation'],
                        title: 'Staff Augmentation',
                        text:
                            'Add specialized engineers quickly for critical initiatives.',
                      ),
                      _TalentCard(
                        key: _sectionKeys['dedicated-teams'],
                        title: 'Dedicated Teams',
                        text:
                            'Cross-functional squads aligned to your domain and roadmap.',
                      ),
                      _TalentCard(
                        key: _sectionKeys['leadership-hiring'],
                        title: 'Leadership Hiring',
                        text:
                            'Hire principal engineers and delivery managers with confidence.',
                      ),
                      _TalentCard(
                        key: _sectionKeys['flexible-engagements'],
                        title: 'Flexible Engagements',
                        text:
                            'Short-term spikes or long-term strategic staffing support.',
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

class _TalentCard extends StatelessWidget {
  const _TalentCard({super.key, required this.title, required this.text});

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
          Text(text, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
