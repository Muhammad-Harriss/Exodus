import 'package:exous/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ComingAprilSection extends StatelessWidget {
  const ComingAprilSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top: 1444.3px (after coming soon btn)
    // All positions relative to this section top
    // page top of this section ≈ 78(nav) + 656(hero) + ~710(feature section)
    // We use offset from section top:
    // top: 1507.65 - 1444.3 = ~63 from section top
    // But we'll use padding/column layout for cleaner code

    return Container(
      width: screenWidth,
      color: const Color(0xFF0A0A0A),
      child: Column(
        children: [

          const SizedBox(height: 48),

          // ── "Coming April 20th!" ──────────────────────
          // width: 211, height: 26
          // font: Montserrat ExtraBold 800, 20.98px
          // text-align: center
          SizedBox(
            width : 211,
            height: 26,
            child : Text(
              'Coming April 20th!',
              textAlign: TextAlign.center,
              style    : GoogleFonts.montserrat(
                fontSize  : 20.98,
                fontWeight: FontWeight.w800,
                color     : Colors.white,
                height    : 1.0,
                letterSpacing: 0,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ── Body text ────────────────────────────────
          // width: 322, height: 51
          // font: Montserrat Medium 500, 14.05px
          // text-align: center, left: 30px
          SizedBox(
            width : 322,
            child : Text(
              'Players will mine Metamoney on their iOS\nSmart Phones, earning the Exodus: Goodbye\nWorld\'s in-game currency.',
              textAlign: TextAlign.center,
              style    : GoogleFonts.montserrat(
                fontSize  : 14.05,
                fontWeight: FontWeight.w500,
                color     : Colors.white,
                height    : 1.0,
                letterSpacing: 0,
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ── Learn more button ─────────────────────────
          Container(
            width : 140,
            height: 42,
            decoration: BoxDecoration(
              color       : const Color(0xFF1A56DB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Learn more',
                style: GoogleFonts.montserrat(
                  fontSize  : 14,
                  fontWeight: FontWeight.w600,
                  color     : Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // ── Stacked images (phone + character) ────────
          // Phone:     width: 139.59, height: 244,  top: 1695, left: 97
          // Character: width: 102.24, height: 206.05, top: 1713.88, left: 181.94
          // Relative positions:
          // Section images top ≈ 1695px from page top
          // phone top    = 0 (reference)
          // char top     = 1713.88 - 1695 = 18.88 from phone top
          // char left    = 181.94 - 97 = 84.94 from phone left
          SizedBox(
            width : screenWidth,
            height: 260,
            child : Stack(
              clipBehavior: Clip.none,
              children    : [

                // ── Phone image ─────────────────────────
                // left: 97, top: 0 (reference)
                Positioned(
                  left: 97,
                  top : 0,
                  child: Image.asset(
                    AppImages.heroPhone,
                    width : 139.59,
                    height: 244,
                    fit   : BoxFit.contain,
                  ),
                ),

                // ── Character image ──────────────────────
                // left: 181.94, top: 18.88
                Positioned(
                  left: 181.94,
                  top : 18.88,
                  child: Image.asset(
                    AppImages.character,
                    width : 102.24,
                    height: 206.05,
                    fit   : BoxFit.contain,
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 32),

        ],
      ),
    );
  }
}