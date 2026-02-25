import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/main_layout.dart';
import '../pages/about_page.dart';
import '../pages/careers_page.dart';
import '../pages/home_page.dart';
import '../pages/industries_page.dart';
import '../pages/resources_page.dart';
import '../pages/services_page.dart';
import '../pages/talent_page.dart';
import '../pages/technologies_page.dart';

MainLayout _withLayout(Widget child) => MainLayout(child: child);

CustomTransitionPage<void> _buildPage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: _withLayout(child),
    transitionDuration: const Duration(milliseconds: 320),
    reverseTransitionDuration: const Duration(milliseconds: 260),
    transitionsBuilder: (context, animation, secondaryAnimation, pageChild) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      final fade = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
      final slide = Tween<Offset>(
        begin: const Offset(0.02, 0),
        end: Offset.zero,
      ).animate(curved);
      return FadeTransition(
        opacity: fade,
        child: SlideTransition(position: slide, child: pageChild),
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => _buildPage(state, const HomePage()),
    ),
    GoRoute(
      path: '/about',
      pageBuilder: (context, state) => _buildPage(state, const AboutPage()),
    ),
    GoRoute(
      path: '/about/who-we-are',
      redirect: (context, state) => '/about?section=who-we-are',
    ),
    GoRoute(
      path: '/about/what-sets-us-apart',
      redirect: (context, state) => '/about?section=what-sets-us-apart',
    ),
    GoRoute(
      path: '/about/leadership',
      redirect: (context, state) => '/about?section=leadership',
    ),
    GoRoute(
      path: '/about/locations',
      redirect: (context, state) => '/about?section=locations',
    ),
    GoRoute(
      path: '/services',
      pageBuilder: (context, state) => _buildPage(state, const ServicesPage()),
    ),
    GoRoute(
      path: '/technologies',
      pageBuilder: (context, state) =>
          _buildPage(state, const TechnologiesPage()),
    ),
    GoRoute(
      path: '/industries',
      pageBuilder: (context, state) =>
          _buildPage(state, const IndustriesPage()),
    ),
    GoRoute(
      path: '/talent',
      pageBuilder: (context, state) => _buildPage(state, const TalentPage()),
    ),
    GoRoute(
      path: '/resources',
      pageBuilder: (context, state) => _buildPage(state, const ResourcesPage()),
    ),
    GoRoute(
      path: '/careers',
      pageBuilder: (context, state) => _buildPage(state, const CareersPage()),
    ),
  ],
);
