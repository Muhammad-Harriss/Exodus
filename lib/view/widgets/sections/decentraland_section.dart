// ignore_for_file: deprecated_member_use

import 'package:exous/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DecentralandSection extends StatelessWidget {
  const DecentralandSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top ≈ 1895px
    // All child positions relative to section top (1895px)

    return SizedBox(
      width : screenWidth,
      height: 865,
      child : Stack(
        clipBehavior: Clip.hardEdge,
        children    : [

          // ── Background image ─────────────────────────
          // width: 1605, height: 865, top: 1895, left: -615
          // Relative to section: top: 0, left: -615
          Positioned(
            top : 0,
            left: -615,
            child: Image.asset(
              AppImages.decentralandbg,
              width : 1605,
              height: 865,
              fit   : BoxFit.cover,
            ),
          ),

          // ── White overlay for readability ─────────────
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.82),
            ),
          ),

          // ── Dus image ─────────────────────────────────
          // width: 104.02, height: 104.02
          // top: 1941.42 - 1895 = 46.42, left: 78
          Positioned(
            top : 46.42,
            left: 78,
            child: Image.asset(
              AppImages.dus,
              width : 104.02,
              height: 104.02,
              fit   : BoxFit.contain,
            ),
          ),

          // ── Orange circle image ───────────────────────
          // width: 101.12, height: 101.12
          // top: 1939 - 1895 = 44, left: 215.88
          Positioned(
            top : 44,
            left: 215.88,
            child: Image.asset(
              AppImages.orangeCircle,
              width : 101.12,
              height: 101.12,
              fit   : BoxFit.contain,
            ),
          ),

          // ── "Coming Soon!" text ───────────────────────
          // width: 180, height: 30
          // top: 2073 - 1895 = 178, left: 103.09
          Positioned(
            top : 178,
            left: 103.09,
            child: SizedBox(
              width : 180,
              height: 30,
              child : Text(
                'Coming Soon!',
                textAlign: TextAlign.center,
                style    : GoogleFonts.montserrat(
                  fontSize  : 24.25,
                  fontWeight: FontWeight.w800,
                  color     : Colors.black,
                  height    : 1.0,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          // ── Body text ─────────────────────────────────
          // width: 400, height: 51
          // top: 2119.89 - 1895 = 224.89, left: -6
          Positioned(
            top : 224.89,
            left: -6,
            child: SizedBox(
              width: 400,
              child: Text(
                'Players will mine Metamoney in Decentraland,\nearning the Exodus: Goodbye World\'s\nin-game currency.',
                textAlign: TextAlign.center,
                style    : GoogleFonts.montserrat(
                  fontSize  : 14.35,
                  fontWeight: FontWeight.w500,
                  color     : Colors.black87,
                  height    : 1.0,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          // ── Learn more button ─────────────────────────
          // width: 145.47, height: 42.56
          // top: 2194.07 - 1895 = 299.07, left: 121.27
          // border-radius: 8.21
          Positioned(
            top : 299.07,
            left: 121.27,
            child: Container(
              width : 145.47,
              height: 42.56,
              decoration: BoxDecoration(
                color       : const Color(0xFF1A56DB),
                borderRadius: BorderRadius.circular(8.21),
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
          ),

          // ── Exodus black logo ─────────────────────────
          // width: 183, height: 37
          // top: 2323 - 1895 = 428, left: 100
          Positioned(
            top : 428,
            left: 100,
            child: Image.asset(
              AppImages.exodusBlackLogo,
              width : 183,
              height: 37,
              fit   : BoxFit.contain,
            ),
          ),

          // ── Alpha stage text ──────────────────────────
          // width: 592, height: 51
          // top: 2378.58 - 1895 = 483.58, left: -109
          Positioned(
            top : 483.58,
            left: -109,
            child: SizedBox(
              width: 592,
              child: Text(
                'Exodus,  is currently in it\'s alpha stage of\ndevelopment. This is mainly for the purpose\nof testing. Try now in Decentraland\'s Metaverse.',
                textAlign: TextAlign.center,
                style    : GoogleFonts.montserrat(
                  fontSize  : 13.64,
                  fontWeight: FontWeight.w500,
                  color     : Colors.black87,
                  height    : 1.0,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          // ── Test the game button ──────────────────────
          // width: 148.83, height: 43.55
          // top: 2449 - 1895 = 554, left: 113
          // border-radius: 8.4
          Positioned(
            top : 554,
            left: 113,
            child: Container(
              width : 148.83,
              height: 43.55,
              decoration: BoxDecoration(
                color       : const Color(0xFF1A56DB),
                borderRadius: BorderRadius.circular(8.4),
              ),
              child: Center(
                child: Text(
                  'Test the game',
                  style: GoogleFonts.montserrat(
                    fontSize  : 14,
                    fontWeight: FontWeight.w600,
                    color     : Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // ── Char with stone image ─────────────────────
          // width: 262.48, height: 279
          // top: 2476 - 1895 = 581, left: 57
          Positioned(
            top : 581,
            left: 57,
            child: Image.asset(
              AppImages.charWithStone,
              width : 262.48,
              height: 279,
              fit   : BoxFit.contain,
            ),
          ),

        ],
      ),
    );
  }
}