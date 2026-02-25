import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'routing/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runApp(const CompanyApp());
}

class CompanyApp extends StatelessWidget {
  const CompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Canus IT Company',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false,
      ),
    );
  }
}
