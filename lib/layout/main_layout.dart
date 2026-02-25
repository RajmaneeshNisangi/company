import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import '../utils/external_links.dart';
import '../widgets/app_header.dart';
import '../widgets/footer.dart';
import '../widgets/navigation_items.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.child});

  final Widget child;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _MobileDrawer(currentPath: currentPath),
      body: Column(
        children: [
          AppHeader(
            currentPath: currentPath,
            onMobileMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  widget.child,
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ).animate().fadeIn(duration: 500.ms),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({required this.currentPath});

  final String currentPath;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      backgroundColor: AppTheme.white,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: AppTheme.space_24,
            horizontal: AppTheme.space_16,
          ),
          children: [
            ...mainNavItems.map((item) {
              if (item.children.isEmpty) {
                return _MobileTile(
                  label: item.label,
                  active: currentPath == item.path,
                  onTap: () {
                    context.pop(); // Close drawer
                    context.go(item.path);
                  },
                );
              } else {
                return ExpansionTile(
                  title: Text(item.label, style: textTheme.bodyLarge),
                  children: item.children
                      .map((child) => _MobileTile(
                            label: child.label,
                            isSubmenu: true,
                            active: currentPath == child.path,
                            onTap: () {
                              context.pop(); // Close drawer
                              context.go(child.path);
                            },
                          ))
                      .toList(),
                );
              }
            }),
            const SizedBox(height: AppTheme.space_24),
            ElevatedButton(
              onPressed: openGetStartedForm,
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileTile extends StatelessWidget {
  const _MobileTile({
    required this.label,
    required this.active,
    required this.onTap,
    this.isSubmenu = false,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;
  final bool isSubmenu;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: isSubmenu
          ? const EdgeInsets.only(left: AppTheme.space_32)
          : EdgeInsets.zero,
      title: Text(
        label,
        style: textTheme.bodyLarge?.copyWith(
          color: active ? AppTheme.primary : AppTheme.text,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
