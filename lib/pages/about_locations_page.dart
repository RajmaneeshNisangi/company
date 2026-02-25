import 'package:flutter/material.dart';

import 'about_who_we_are_page.dart';

class AboutLocationsPage extends StatelessWidget {
  const AboutLocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutDetailTemplate(
      title: 'Locations',
      subtitle:
          'A distributed delivery model with global presence and local collaboration.',
      body:
          'We support clients from hubs in North America and India, with flexible onsite, nearshore, and remote engagement options designed for speed and continuity.',
    );
  }
}
