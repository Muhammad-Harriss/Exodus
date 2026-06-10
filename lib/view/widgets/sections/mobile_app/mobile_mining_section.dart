import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileMiningSection extends StatelessWidget {
  const MobileMiningSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top ≈ 1490px
    // All positions relative to section top
    // top: 1565 - 1490 = 75 from section top

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 75),

          // ── "Mining Functionality" heading ────────────
          // width: 248.24, height: 28
          // top: 1565 - 1490 = 75, left: 63
          // font: Montserrat Bold 700, 22.6px
          // color: #FFFFFF
          Padding(
            padding: const EdgeInsets.only(left: 63),
            child  : SizedBox(
              width : 248.24,
              height: 28,
              child : Text(
                'Mining Functionality',
                style: GoogleFonts.montserrat(
                  fontSize     : 22.6,
                  fontWeight   : FontWeight.w700,
                  color        : const Color(0xFFFFFFFF),
                  height       : 1.0,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          const SizedBox(height: 17),

          // ── Body text ─────────────────────────────────
          // width: 310, height: 203
          // top: 1610 - 1490 = 120, left: 32
          // font: Montserrat Medium 500, 10px
          // line-height: 141%, color: #C8C8C8CC
          // text-align: center
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child  : SizedBox(
              width : 310,
              height: 203,
              child : Text(
                'Mining Metamoney works similar to bitcoin mining but players replace computers and tier replaces hashrate. It doesn\'t use electricity like bitcoin mining does. When a player begins mining, they cause "Rock Damage". This contributes to the "Rock Difficulty" which is all players "Rock Impact" combined for the previous hour. The rock difficulty adjusts hourly based on previous hour of rock damage to maintain average currency generation of 114 Million coins per hour or 1 Trillion coins per year. If one player is mining or millions, they split the total coins based on their contribution. To give an example, if rock difficulty is 100 and ten players have 10 "Rock Impact", each mining for an hour straight, they would all get 10% of the ~114m coins or 11.4m coins each for that hour.',
                textAlign: TextAlign.center,
                style    : GoogleFonts.montserrat(
                  fontSize     : 10,
                  fontWeight   : FontWeight.w500,
                  color        : const Color(0xCCC8C8C8), // #C8C8C8CC
                  height       : 1.41,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // ── Bullet points ──────────────────────────────
          // width: 632, height: 63
          // top: 1824 - 1490 = 334, left: -137
          // font: Montserrat Medium 500, 13px
          // line-height: 141%, text-align: center
          // color: white (same style as screenshot)
          SizedBox(
            width : screenWidth,
            height: 63,
            child : Stack(
              children: [
                Positioned(
                  left: -137,
                  top : 0,
                  child: SizedBox(
                    width : 632,
                    height: 63,
                    child : Text(
                      '• Higher Tier = Higher Rock Damage\n• Rock Impact (Mining Difficulty) Adjusts Hourly\n• Stable Currency Generation\n• 114m Metamoney Generated hourly',
                      textAlign: TextAlign.center,
                      style    : GoogleFonts.montserrat(
                        fontSize     : 13,
                        fontWeight   : FontWeight.w500,
                        color        : Colors.white,
                        height       : 1.41,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

        ],
      ),
    );
  }
}