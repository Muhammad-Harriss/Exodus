import 'package:exous/view/widgets/sections/prefrences/prefrences_section.dart';
import 'package:exous/view/widgets/sections/mobile_app/mobile_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),

      // ── Persistent bottom bar — Preferences tab highlighted ──
      bottomNavigationBar: const MobileBottomBar(
        activeTab: 'preferences',
      ),

      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child  : Column(
          children: [

            // ── 1. Navbar ──────────────────────────────
            const NavbarWidget(),

            // ── 2. Preferences content ─────────────────
            const PreferencesSection(),

          ],
        ),
      ),
    );
  }
}