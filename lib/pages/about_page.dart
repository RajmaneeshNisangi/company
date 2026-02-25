import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page_banner.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_title.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _sectionKeys = <String, GlobalKey>{
    'who-we-are': GlobalKey(),
    'what-sets-us-apart': GlobalKey(),
    'leadership': GlobalKey(),
    'locations': GlobalKey(),
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
          title: 'About Us',
          subtitle:
              'We are a technology and talent partner helping ambitious companies innovate with confidence.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'About Overview',
                    subtitle:
                        'Explore all About sections in one page. Use the About dropdown in the header to jump smoothly to each section.',
                  ),
                  const SizedBox(height: 28),
                  ResponsiveGrid(
                    minItemWidth: 320,
                    children: [
                      _InfoCard(
                        key: _sectionKeys['who-we-are'],
                        title: 'Who We Are',
                        body:
                            'Canus Tech blends strategic consulting, engineering execution, and talent enablement into a single high-velocity delivery model.',
                      ),
                      _InfoCard(
                        key: _sectionKeys['what-sets-us-apart'],
                        title: 'What Sets Us Apart',
                        body:
                            'We combine senior engineering ownership, transparent communication, and outcome-focused delivery in every engagement.',
                      ),
                      _InfoCard(
                        key: _sectionKeys['leadership'],
                        title: 'Leadership',
                        body:
                            'Our leadership team includes product strategists, architects, and delivery heads with deep enterprise transformation experience.',
                      ),
                      _InfoCard(
                        key: _sectionKeys['locations'],
                        title: 'Locations',
                        body:
                            'We support clients from North America and India through onsite, nearshore, and remote collaboration models.',
                      ),
                      const _InfoCard(
                        title: 'Mission',
                        body:
                            'Deliver practical digital transformation through strong architecture, quality engineering, and trusted collaboration.',
                      ),
                      const _InfoCard(
                        title: 'Vision',
                        body:
                            'Build resilient organizations where technology and people combine to accelerate sustained growth.',
                      ),
                      const _InfoCard(
                        title: 'Approach',
                        body:
                            'Agile, transparent, and measurable delivery with domain-focused teams and clear ownership.',
                      ),
                      const _InfoCard(
                        title: 'Values',
                        body:
                            'Quality, accountability, and long-term trust are the foundations of every client engagement.',
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

class _InfoCard extends StatelessWidget {
  const _InfoCard({super.key, required this.title, required this.body});

  final String title;
  final String body;

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
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(body, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
