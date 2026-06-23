import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileMiningSection extends StatelessWidget {
  const MobileMiningSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: const Color(0xFF080818),
      // Use clean overall padding instead of hardcoded individual widget offsets
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Centers headings and layouts natively
        children: [
          const SizedBox(height: 60),

          // ── "Mining Functionality" heading ────────────
          Text(
            'Mining Functionality',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 24, // Slightly enlarged for clean mobile visibility
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFFFFFF),
              height: 1.2,
            ),
          ),

          const SizedBox(height: 20),

          // ── Body text ─────────────────────────────────
          // Removed the restrictive 310x203 fixed constraints so text flows and shapes properly
          Text(
            'Mining Metamoney works similar to bitcoin mining but players replace computers and tier replaces hashrate. It doesn\'t use electricity like bitcoin mining does. When a player begins mining, they cause "Rock Damage". This contributes to the "Rock Difficulty" which is all players "Rock Impact" combined for the previous hour. The rock difficulty adjusts hourly based on previous hour of rock damage to maintain average currency generation of 114 Million coins per hour or 1 Trillion coins per year. If one player is mining or millions, they split the total coins based on their contribution. To give an example, if rock difficulty is 100 and ten players have 10 "Rock Impact", each mining for an hour straight, they would all get 10% of the ~114m coins or 11.4m coins each for that hour.',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 11, // Upped slightly to 11px for better readability at scale
              fontWeight: FontWeight.w500,
              color: const Color(0xCCC8C8C8), 
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          // ── Bullet points ──────────────────────────────
          // Completely removed the Stack + Positioned layout that was shifting text off-screen
          Text(
            '• Higher Tier = Higher Rock Damage\n'
            '• Rock Impact (Mining Difficulty) Adjusts Hourly\n'
            '• Stable Currency Generation\n'
            '• 114m Metamoney Generated hourly',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.6, // Clean spacing between your bullet lists
            ),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}