import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../sections/home/core_services_section.dart';
import '../sections/home/testimonials_section.dart';
import '../utils/external_links.dart';
import '../widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeroSection(
          title: 'Your Partner in Tech, Talent & Transformation',
          subtitle:
              'We help global teams ship better products, modernize delivery, and scale with high-impact engineering and talent solutions.',
          buttonText: 'Get Started',
          onPressed: openGetStartedForm,
          onSecondaryPressed: () => context.go('/services'),
        ),
        const CoreServicesSection(),
        const TestimonialsSection(),
      ],
    );
  }
}
