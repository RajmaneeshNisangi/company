import 'package:flutter/material.dart';

import '../widgets/page_banner.dart';
import '../widgets/section_title.dart';

class AboutWhoWeArePage extends StatelessWidget {
  const AboutWhoWeArePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutDetailTemplate(
      title: 'Who We Are',
      subtitle:
          'We are engineers, consultants, architects, and delivery leaders committed to solving business-critical technology challenges.',
      body:
          'Our teams combine strong product thinking with enterprise-grade execution. We operate as long-term partners, not short-term vendors, and we align every engagement to measurable business outcomes.',
    );
  }
}

class AboutDetailTemplate extends StatelessWidget {
  const AboutDetailTemplate({
    super.key,
    required this.title,
    required this.subtitle,
    required this.body,
  });

  final String title;
  final String subtitle;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageBanner(title: title, subtitle: subtitle),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 980),
              child: Column(
                children: [
                  SectionTitle(title: title, subtitle: subtitle),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
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
                    child: Text(
                      body,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
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
