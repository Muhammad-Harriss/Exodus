import 'package:exous/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RoadmapSection extends StatelessWidget {
  const RoadmapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top ≈ 2760px
    // All positions relative to section top
    // top: 2826 - 2760 = 66 from section top

    return Container(
      width : screenWidth,
      height: 450,
      color : const Color(0xFF080818),
      child : Stack(
        clipBehavior: Clip.hardEdge,
        children    : [

          // ── "Roadmap" heading ─────────────────────────
          // width: 97, height: 23
          // top: 2826 - 2760 = 66, left: 144.71
          Positioned(
            top : 66,
            left: 144.71,
            child: SizedBox(
              width : 97,
              height: 23,
              child : Text(
                'Roadmap',
                textAlign: TextAlign.center,
                style    : GoogleFonts.montserrat(
                  fontSize  : 18.93,
                  fontWeight: FontWeight.w800,
                  color     : Colors.white,
                  height    : 1.0,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          // ── Body text ─────────────────────────────────
          // width: 340, height: 129
          // top: 2864 - 2760 = 104, left: 18
          Positioned(
            top : 104,
            left: 18,
            child: SizedBox(
              width : 340,
              height: 129,
              child : Text(
                'Exodus: Goodbye World is a Metaverse Role-Playing Game. Our mission is to Break Barriers for Players and help bridge the platform shift from traditional gaming to blockchain based. The Exodus game has a variety of great content from Combat & Skilling to questing and Crypto Mining.',
                textAlign: TextAlign.center,
                style    : GoogleFonts.montserrat(
                  fontSize  : 12,
                  fontWeight: FontWeight.w500,
                  color     : Colors.white,
                  height    : 1.23,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          // ── Learn more button ─────────────────────────
          // width: 113.57, height: 33.23
          // top: 2976.35 - 2760 = 216.35, left: 133.77
          // border-radius: 6.41, color: #3853A4
          Positioned(
            top : 216.35,
            left: 133.77,
            child: Container(
              width : 113.57,
              height: 33.23,
              decoration: BoxDecoration(
                color       : const Color(0xFF3853A4),
                borderRadius: BorderRadius.circular(6.41),
              ),
              child: Center(
                child: Text(
                  'Learn more',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13,
                    fontWeight: FontWeight.w600,
                    color     : Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // ── Roadmap bg image ──────────────────────────
          // width: 193, height: 193
          // top: 3006 - 2760 = 246, left: 90
          Positioned(
            top : 246,
            left: 90,
            child: Image.asset(
              AppImages.roadmapBg,
              width : 193,
              height: 193,
              fit   : BoxFit.contain,
            ),
          ),

        ],
      ),
    );
  }
}