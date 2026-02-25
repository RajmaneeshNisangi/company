import 'package:flutter/material.dart';

import 'about_who_we_are_page.dart';

class AboutLeadershipPage extends StatelessWidget {
  const AboutLeadershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutDetailTemplate(
      title: 'Leadership',
      subtitle:
          'Experienced technology leaders guiding teams through complex product and platform transformations.',
      body:
          'Our leadership group includes delivery heads, principal architects, and domain experts with deep experience in enterprise modernization, digital product engineering, and talent strategy.',
    );
  }
}
