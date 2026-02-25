import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.centered = true,
  });

  final String title;
  final String subtitle;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final textAlign = centered ? TextAlign.center : TextAlign.left;
    final titleStyle = Theme.of(context).textTheme.headlineMedium;
    final subtitleStyle = Theme.of(context).textTheme.bodyLarge;

    return Column(
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: textAlign,
          style: titleStyle?.copyWith(
            color: const Color(0xFF0E1F38),
            height: 1.2,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            subtitle,
            textAlign: textAlign,
            style: subtitleStyle?.copyWith(
              color: AppTheme.bodyText.withValues(alpha: 0.85),
              height: 1.65,
            ),
          ),
        ),
      ],
    );
  }
}
