import 'package:exous/view/widgets/sections/mobile_app/mobile_screen_footer_section.dart';
import 'package:exous/view/widgets/sections/mobile_app/mobile_bottom_bar.dart';
import 'package:exous/view/widgets/sections/newsletter_section.dart';
import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/mobile_app/mobile_hero_section.dart';
import '../widgets/sections/mobile_app/mobile_crypto_section.dart';
import '../widgets/sections/mobile_app/mobile_mining_section.dart';
import '../widgets/sections/mobile_app/mobile_tier_section.dart';

class MobileAppScreen extends StatelessWidget {
  const MobileAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),

      // ── Persistent bottom bar (stays fixed, doesn't scroll) ──
      bottomNavigationBar: const MobileBottomBar(),

      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child  : Column(
          children: [

            // ── 1. Navbar ──────────────────────────────
            const NavbarWidget(),

            // ── 2. Hero section ────────────────────────
            const MobileHeroSection(),

            // ── 3. Crypto mining section ───────────────
            const MobileCryptoSection(),

            // ── 4. Mining functionality section ────────
            const MobileMiningSection(),

            // ── 5. Tier cards section ──────────────────
            const MobileTierSection(),

            // ── 6. Newsletter section ───────────────────
            const NewsletterSection(),

            // ── 7. Footer section ────────────────────────
            const MobileScreenFooterSection(),

          ],
        ),
      ),
    );
  }
}