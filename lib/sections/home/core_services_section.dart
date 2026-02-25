import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/responsive_grid.dart';
import '../../widgets/scroll_reveal.dart';
import '../../widgets/section_title.dart';
import '../../widgets/service_card.dart';

class CoreServicesSection extends StatelessWidget {
  const CoreServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 84),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            children: [
              const ScrollReveal(
                child: SectionTitle(
                  title: 'Core Services',
                  subtitle:
                      'From engineering to strategic staffing, our teams design and deliver scalable digital systems aligned with measurable business outcomes.',
                ),
              ),
              const SizedBox(height: 38),
              ResponsiveGrid(
                minItemWidth: 260,
                spacing: 22,
                children: const [
                  ScrollReveal(
                    delay: Duration(milliseconds: 80),
                    child: ServiceCard(
                      icon: Icons.lan_rounded,
                      title: 'Digital Engineering',
                      description:
                          'End-to-end product engineering for modern web, cloud, and mobile platforms with strong delivery rigor.',
                    ),
                  ),
                  ScrollReveal(
                    delay: Duration(milliseconds: 140),
                    child: ServiceCard(
                      icon: Icons.psychology_rounded,
                      title: 'AI & Automation',
                      description:
                          'Applied AI solutions that improve customer journeys, workflow velocity, and decision intelligence.',
                    ),
                  ),
                  ScrollReveal(
                    delay: Duration(milliseconds: 200),
                    child: ServiceCard(
                      icon: Icons.cloud_done_rounded,
                      title: 'Cloud Modernization',
                      description:
                          'Secure migration and optimization services across cloud-native architectures and platform operations.',
                    ),
                  ),
                  ScrollReveal(
                    delay: Duration(milliseconds: 260),
                    child: ServiceCard(
                      icon: Icons.groups_rounded,
                      title: 'Talent Solutions',
                      description:
                          'Flexible staffing models to rapidly scale with vetted professionals aligned to your product roadmap.',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              ScrollReveal(
                delay: const Duration(milliseconds: 180),
                child: Text(
                  'Focused on measurable value, quality delivery, and long-term partnerships.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.bodyText.withValues(alpha: 0.9),
                        height: 1.6,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
