import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import '../utils/external_links.dart';
import 'navigation_items.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.currentPath,
    required this.onMobileMenuTap,
  });

  final String currentPath;
  final VoidCallback onMobileMenuTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 1060;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.92),
            border: Border(
              bottom: BorderSide(color: AppTheme.primary.withValues(alpha: 0.08)),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF081738).withValues(alpha: 0.06),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1240),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => context.go('/'),
                        borderRadius: BorderRadius.circular(12),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          child: _Logo(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: isMobile
                            ? const SizedBox.shrink()
                            : Align(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ...mainNavItems.map(
                                        (item) => item.children.isEmpty
                                            ? _NavButton(
                                                label: item.label,
                                                isActive: _isPathActive(
                                                  currentPath,
                                                  item.path,
                                                ),
                                                onPressed: () =>
                                                    context.go(item.path),
                                              )
                                            : _NavDropdown(
                                                label: item.label,
                                                items: item.children,
                                                isActive: _isPathActive(
                                                  currentPath,
                                                  item.path,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      if (!isMobile)
                        _HeaderCtaButton(onPressed: openGetStartedForm)
                      else
                        IconButton(
                          onPressed: onMobileMenuTap,
                          style: IconButton.styleFrom(
                            foregroundColor: AppTheme.primary,
                            backgroundColor: AppTheme.secondary,
                          ),
                          icon: const Icon(Icons.menu_rounded, size: 22),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 350.ms).slideY(
          begin: -0.2,
          end: 0,
          curve: Curves.easeOutCubic,
          duration: 350.ms,
        );
  }

  static bool _isPathActive(String currentPath, String path) {
    if (path == '/') {
      return currentPath == '/';
    }
    return currentPath == path || currentPath.startsWith('$path/');
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTheme.primary, AppTheme.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.32),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.auto_awesome_rounded, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Text(
          'CANUS TECH',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color(0xFF12284B),
                fontWeight: FontWeight.w800,
                letterSpacing: 0.4,
              ),
        ),
      ],
    );
  }
}

class _HeaderCtaButton extends StatefulWidget {
  const _HeaderCtaButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_HeaderCtaButton> createState() => _HeaderCtaButtonState();
}

class _HeaderCtaButtonState extends State<_HeaderCtaButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: _hovered
            ? Matrix4.translationValues(0.0, -2.0, 0.0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: _hovered ? 0.32 : 0.2),
              blurRadius: _hovered ? 18 : 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: FilledButton(
          onPressed: widget.onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          child: const Text('Get Started'),
        ),
      ),
    );
  }
}

class _NavDropdown extends StatefulWidget {
  const _NavDropdown({
    required this.label,
    required this.items,
    required this.isActive,
  });

  final String label;
  final List<NavItem> items;
  final bool isActive;

  @override
  State<_NavDropdown> createState() => _NavDropdownState();
}

class _NavDropdownState extends State<_NavDropdown> {
  final MenuController _menuController = MenuController();
  static MenuController? _activeMenuController;
  bool _isHovered = false;

  void _openAndCloseOthers() {
    final active = _activeMenuController;
    if (active != null && active != _menuController && active.isOpen) {
      active.close();
    }
    _menuController.open();
    _activeMenuController = _menuController;
  }

  @override
  void dispose() {
    if (_activeMenuController == _menuController) {
      _activeMenuController = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isHighlighted = _isHovered || _menuController.isOpen || widget.isActive;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _openAndCloseOthers();
      },
      onExit: (_) => setState(() => _isHovered = false),
      child: MenuAnchor(
        controller: _menuController,
        alignmentOffset: const Offset(0, 12),
        style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
            Colors.white.withValues(alpha: 0.98),
          ),
          elevation: const WidgetStatePropertyAll(12),
          shadowColor: WidgetStatePropertyAll(
            AppTheme.primary.withValues(alpha: 0.12),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8),
          ),
        ),
        menuChildren: widget.items
            .map(
              (item) => SizedBox(
                width: 340,
                child: MenuItemButton(
                  onPressed: () => context.go(item.path),
                  style: MenuItemButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  child: Text(
                    item.label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.text,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            )
            .toList(),
        builder: (context, controller, child) => InkWell(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
              if (_activeMenuController == _menuController) {
                _activeMenuController = null;
              }
            } else {
              _openAndCloseOthers();
            }
          },
          borderRadius: BorderRadius.circular(10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            curve: Curves.easeOutCubic,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: isHighlighted
                  ? AppTheme.primary.withValues(alpha: 0.08)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isHighlighted ? AppTheme.primary : AppTheme.text,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(width: 4),
                Icon(
                  controller.isOpen
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: isHighlighted ? AppTheme.primary : AppTheme.bodyText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  const _NavButton({
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isHighlighted = _isHovered || widget.isActive;

    return InkWell(
      onTap: widget.onPressed,
      onHover: (hovered) => setState(() => _isHovered = hovered),
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isHighlighted
              ? AppTheme.primary.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isHighlighted ? AppTheme.primary : AppTheme.text,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
