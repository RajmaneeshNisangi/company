import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.secondaryButtonText = 'View Services',
    this.onSecondaryPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final String secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.of(context).size.width < 960;
    final titleStyle = isCompact
        ? Theme.of(context).textTheme.headlineLarge
        : Theme.of(context).textTheme.displayMedium;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, isCompact ? 72 : 96, 24, isCompact ? 72 : 88),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Stack(
            children: [
              Positioned(
                right: isCompact ? -80 : -20,
                top: -40,
                child: _GlowBlob(
                  size: isCompact ? 200 : 280,
                  color: AppTheme.accent.withValues(alpha: 0.16),
                ),
              ),
              Positioned(
                left: -100,
                bottom: -80,
                child: _GlowBlob(
                  size: 260,
                  color: AppTheme.primary.withValues(alpha: 0.13),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF6FAFF), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: AppTheme.primary.withValues(alpha: 0.08),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0B1F42).withValues(alpha: 0.09),
                      blurRadius: 40,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(isCompact ? 28 : 44),
                  child: isCompact
                      ? _HeroContentColumn(
                          title: title,
                          subtitle: subtitle,
                          titleStyle: titleStyle,
                          buttonText: buttonText,
                          onPressed: onPressed,
                          secondaryButtonText: secondaryButtonText,
                          onSecondaryPressed: onSecondaryPressed,
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: _HeroCopy(
                                title: title,
                                subtitle: subtitle,
                                titleStyle: titleStyle,
                                buttonText: buttonText,
                                onPressed: onPressed,
                                secondaryButtonText: secondaryButtonText,
                                onSecondaryPressed: onSecondaryPressed,
                              ),
                            ),
                            const SizedBox(width: 36),
                            const Expanded(child: _HeroStatsPanel()),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 450.ms).slideY(
          begin: 0.08,
          end: 0,
          curve: Curves.easeOutCubic,
          duration: 500.ms,
        );
  }
}

class _HeroContentColumn extends StatelessWidget {
  const _HeroContentColumn({
    required this.title,
    required this.subtitle,
    required this.titleStyle,
    required this.buttonText,
    required this.onPressed,
    required this.secondaryButtonText,
    required this.onSecondaryPressed,
  });

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final String buttonText;
  final VoidCallback onPressed;
  final String secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroCopy(
          title: title,
          subtitle: subtitle,
          titleStyle: titleStyle,
          buttonText: buttonText,
          onPressed: onPressed,
          secondaryButtonText: secondaryButtonText,
          onSecondaryPressed: onSecondaryPressed,
        ),
        const SizedBox(height: 28),
        const _HeroStatsPanel(),
      ],
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.title,
    required this.subtitle,
    required this.titleStyle,
    required this.buttonText,
    required this.onPressed,
    required this.secondaryButtonText,
    required this.onSecondaryPressed,
  });

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final String buttonText;
  final VoidCallback onPressed;
  final String secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'DIGITAL TRANSFORMATION PARTNER',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          title,
          style: titleStyle?.copyWith(
            color: const Color(0xFF0D1B33),
            height: 1.12,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.bodyText,
                height: 1.65,
              ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(buttonText),
            ),
            OutlinedButton(
              onPressed: onSecondaryPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primary,
                side: BorderSide(color: AppTheme.primary.withValues(alpha: 0.25)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(secondaryButtonText),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroStatsPanel extends StatelessWidget {
  const _HeroStatsPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.08)),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _MetricTile(
            value: '120+',
            label: 'Digital products delivered across SaaS, enterprise, and growth-stage teams.',
          ),
          SizedBox(height: 16),
          _MetricTile(
            value: '35%',
            label: 'Average reduction in delivery cycle time after modernization engagement.',
          ),
          SizedBox(height: 16),
          _MetricTile(
            value: '99.9%',
            label: 'Availability targets achieved for mission-critical platform initiatives.',
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            color: AppTheme.accent,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w700,
                      height: 1.05,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.bodyText,
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GlowBlob extends StatelessWidget {
  const _GlowBlob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              color,
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}
