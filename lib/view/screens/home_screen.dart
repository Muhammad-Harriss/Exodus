import 'package:exous/view/widgets/sections/comming_april_section.dart';
import 'package:exous/view/widgets/sections/feature_boxes_sections.dart';
import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/decentraland_section.dart';
import '../widgets/sections/roadmap_section.dart';
import '../widgets/sections/faq_section.dart';
import '../widgets/sections/newsletter_section.dart';
import '../widgets/sections/partners_footer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

            // ── 2. Hero ────────────────────────────────
            const HeroSection(),

            // ── 3. Feature boxes + Phone + Coming Soon ─
            const FeatureBoxesSection(),

            // ── 4. Coming April 20th ───────────────────
            const ComingAprilSection(),

            // ── 5. Decentraland + Test game ────────────
            const DecentralandSection(),

            // ── 6. Roadmap ─────────────────────────────
            const RoadmapSection(),

            // ── 7. FAQ ─────────────────────────────────
            const FaqSection(),

            // ── 8. Newsletter ──────────────────────────
            const NewsletterSection(),

            // ── 9. Partners + Footer ───────────────────
            const PartnersFooterSection(),

          ],
        ),
      ),
    );
  }
}