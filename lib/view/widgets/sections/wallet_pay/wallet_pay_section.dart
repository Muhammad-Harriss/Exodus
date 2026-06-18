// ignore_for_file: deprecated_member_use

import 'package:exous/view/screens/wallet_pay_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_images.dart';

class WalletPaySection extends StatelessWidget {
  const WalletPaySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: const Color(0xFF080818),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),

          // ── Dawn article card ──────────────────────────
          // width: 312.43, height: 203
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImages.dawn,
              width: 312.43,
              height: 203,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 14),

          // ── "The launch of a new dawn" heading ─────────
          // single line — width auto-fit, font scaled down to fit
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'The launch of a new dawn',
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
            ),
          ),

          const SizedBox(height: 9),

          // ── Description ──────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Why are we drawn to video games where we have to complete tasks that, in real life, may be unappealing or boring? Here are four games that show how the mundane can be made extraordinary and surreal.',
              style: GoogleFonts.montserrat(
                fontSize: 11.1,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
                height: 1.4,
              ),
            ),
          ),

          const SizedBox(height: 13),

          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (_) => const WalletPayDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 157.01,
                  height: 33.14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3853A4),
                    borderRadius: BorderRadius.circular(7.71),
                  ),
                  child: Center(
                    child: Text(
                      'Read more',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.08,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // ── Battle bots card 1 ─────────────────────────
          _BattleBotsCard(),

          const SizedBox(height: 20),

          // ── Battle bots card 2 (repeated) ──────────────
          _BattleBotsCard(),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ── Battle Bots Card ─────────────────────────────────────
class _BattleBotsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 282,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF4463BF), width: 1.5),
      ),
      child: Stack(
        children: [
          // ── Battle image ──────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImages.battle,
              width: 317,
              height: 282,
              fit: BoxFit.cover,
            ),
          ),

          // ── Dark gradient overlay (for text) ───────────
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  stops: const [0.45, 1.0],
                ),
              ),
            ),
          ),

          // ── Text content (date + title) ────────────────
          Positioned(
            left: 19,
            right: 19,
            bottom: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "March 22nd 2023" date
                Text(
                  'March 22nd 2023',
                  style: GoogleFonts.montserrat(
                    fontSize: 7.81,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF8BA3EC),
                    height: 1.0,
                  ),
                ),

                const SizedBox(height: 6),

                // "Why battle bots?" heading — single line
                Text(
                  'Why battle bots?',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
