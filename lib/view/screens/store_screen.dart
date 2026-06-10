import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/store/store_section.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child  : Column(
          children: [

            // ── 1. Navbar ──────────────────────────────
            const NavbarWidget(),

            // ── 2. Store section ───────────────────────
            const StoreSection(),

          ],
        ),
      ),
    );
  }
}