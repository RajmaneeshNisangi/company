import 'package:flutter/material.dart';

import 'about_who_we_are_page.dart';

class AboutWhatSetsUsApartPage extends StatelessWidget {
  const AboutWhatSetsUsApartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutDetailTemplate(
      title: 'What Sets Us Apart',
      subtitle:
          'A balanced model of strategy, hands-on execution, and scalable talent enablement.',
      body:
          'We bring senior leadership attention, agile engineering depth, and transparent governance in every engagement. This creates faster feedback loops, lower delivery risk, and stronger long-term value for clients.',
    );
  }
}
