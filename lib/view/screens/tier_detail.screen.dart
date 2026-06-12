import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/tier_detail/tier_detail_section.dart';

class TierDetailScreen extends StatelessWidget {
  final String imageName;
  final String title;
  final double price;

  const TierDetailScreen({
    super.key,
    required this.imageName,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body           : SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child  : Column(
          children: [

            // ── 1. Navbar ──────────────────────────────
            const NavbarWidget(),

            // ── 2. Tier detail section ─────────────────
            TierDetailSection(
              imageName: imageName,
              title    : title,
              price    : price,
            ),

          ],
        ),
      ),
    );
  }
}