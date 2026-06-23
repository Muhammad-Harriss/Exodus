import 'package:exous/core/constants/app_images.dart';
import 'package:flutter/material.dart';


class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width : screenWidth,
      height: 656,   // 734 - 78 (navbar)
      child : Stack(
        clipBehavior: Clip.hardEdge,
        children    : [

          // ── Background image ────────────────────────
          // Original: width 1435, left -500
          // Centers the cave opening on mobile
          Positioned(
            top : 0,
            left: -(1435 - screenWidth) / 2 - 50,
            child: Image.asset(
              AppImages.heroBg,
              width : 1435,
              height: 656,
              fit   : BoxFit.cover,
            ),
          ),

          // ── Bottom fade overlay ──────────────────────
          Positioned(
            bottom: 0,
            left  : 0,
            right : 0,
            child : Container(
              height: 120,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin : Alignment.topCenter,
                  end   : Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xFF080818),
                  ],
                ),
              ),
            ),
          ),

          // ── EXODUS logo text ─────────────────────────
          // width: 353, height: 75.47
          // top: 252 - 78 = 174, left: 4
          Positioned(
            top : 174,
            left: 10.5,
            child: Image.asset(
              AppImages.exodusHeroLogo,
              width : 353,
              height: 75.47,
              fit   : BoxFit.contain,
            ),
          ),

          // ── Mining Penelope character ─────────────────
          // width: 301, height: 301
          // top: 346 - 78 = 268, left: 42
          Positioned(
            top : 268,
            left: 42,
            child: Image.asset(
              AppImages.heroCharacter,
              width : 301,
              height: 301,
              fit   : BoxFit.contain,
            ),
          ),

          // ── Right stone (flipped -180deg) ─────────────
          // width: 79.78, height: 79.78
          // top: 518 - 78 = 440, left: 112.46
          Positioned(
            top : 440,
            left: 112.46,
            child: Transform.rotate(
              angle: 3.14159,
              child: Image.asset(
                AppImages.stoneRight,
                width : 79.78,
                height: 79.78,
                fit   : BoxFit.contain,
              ),
            ),
          ),

          // ── Left stone ────────────────────────────────
          // width: 91.70, height: 91.70
          // top: 506.08 - 78 = 428.08, left: 155.98
          Positioned(
            top : 428.08,
            left: 155.98,
            child: Image.asset(
              AppImages.stoneLeft,
              width : 91.70,
              height: 91.70,
              fit   : BoxFit.contain,
            ),
          ),

        ],
      ),
    );
  }
}