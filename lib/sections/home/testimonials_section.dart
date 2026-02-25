import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/responsive_grid.dart';
import '../../widgets/scroll_reveal.dart';
import '../../widgets/section_title.dart';
import '../../widgets/testimonial_card.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F6FC),
        border: Border(
          top: BorderSide(color: AppTheme.primary.withValues(alpha: 0.06)),
          bottom: BorderSide(color: AppTheme.primary.withValues(alpha: 0.06)),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 84),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            children: [
              const ScrollReveal(
                child: SectionTitle(
                  title: 'Client Testimonials',
                  subtitle:
                      'Trusted by companies across fintech, healthcare, SaaS, and enterprise transformation initiatives.',
                ),
              ),
              const SizedBox(height: 34),
              ResponsiveGrid(
                minItemWidth: 320,
                spacing: 22,
                children: const [
                  ScrollReveal(
                    delay: Duration(milliseconds: 80),
                    child: SizedBox(
                      height: 260,
                      child: TestimonialCard(
                        quote:
                            'Canus Tech helped us cut release cycles in half while improving engineering quality and platform reliability.',
                        author: 'CTO, Fintech Platform',
                        role: 'United States',
                      ),
                    ),
                  ),
                  ScrollReveal(
                    delay: Duration(milliseconds: 150),
                    child: SizedBox(
                      height: 260,
                      child: TestimonialCard(
                        quote:
                            'Their talent model gave us immediate access to senior developers who delivered from day one.',
                        author: 'VP Engineering, Healthcare',
                        role: 'North America',
                      ),
                    ),
                  ),
                  ScrollReveal(
                    delay: Duration(milliseconds: 220),
                    child: SizedBox(
                      height: 260,
                      child: TestimonialCard(
                        quote:
                            'They brought strong architecture discipline and transparent execution across the full roadmap.',
                        author: 'Product Director, SaaS',
                        role: 'Global Delivery',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
