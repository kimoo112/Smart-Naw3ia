import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../widgets/floating_menu_button.dart';
import '../widgets/home_header.dart';
import '../widgets/sections/section_tabs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FF),
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            Expanded(child: SectionTabs()),
          ],
        ),
      ),
      floatingActionButton: const FloatingMenuButton(),
      floatingActionButtonLocation: ExpandableFab.location,
    );
  }
}
