import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import 'navigation_items.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0A1426),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 44),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 40,
                runSpacing: 30,
                children: [
                  const _FooterBlock(
                    title: 'Contact',
                    content: [
                      'hello@canustech.com',
                      '+1 (555) 102-2026',
                      'Austin, TX | New York, NY | Toronto, ON',
                    ],
                  ),
                  _FooterLinkBlock(
                    title: 'Company',
                    links: const [
                      NavItem(label: 'About', path: '/about'),
                      NavItem(label: 'Services', path: '/services'),
                      NavItem(label: 'Careers', path: '/careers'),
                    ],
                  ),
                  _FooterLinkBlock(
                    title: 'Insights',
                    links: const [
                      NavItem(label: 'Resources', path: '/resources'),
                      NavItem(label: 'Technologies', path: '/technologies'),
                      NavItem(label: 'Industries', path: '/industries'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Divider(color: Color(0xFF1D2A3E)),
              const SizedBox(height: 16),
              const Text(
                '(c) 2026 Canus Tech. All rights reserved. | Privacy Policy | Terms of Use',
                style: TextStyle(color: Color(0xFF9FAFC3)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterBlock extends StatelessWidget {
  const _FooterBlock({required this.title, required this.content});

  final String title;
  final List<String> content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 10),
          ...content.map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                line,
                style: const TextStyle(color: Color(0xFFB5C4D5), height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLinkBlock extends StatelessWidget {
  const _FooterLinkBlock({required this.title, required this.links});

  final String title;
  final List<NavItem> links;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 10),
          ...links.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                onTap: () => context.go(item.path),
                child: Text(
                  item.label,
                  style: const TextStyle(color: AppTheme.accent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
