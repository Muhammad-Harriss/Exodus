import 'package:flutter/material.dart';
import 'mobile_hero_bg.dart';
import 'mobile_hero_logo.dart';
import 'mobile_hero_title.dart';
import 'mobile_hero_phone.dart';
import 'mobile_play_now_button.dart';

class MobileHeroSection extends StatelessWidget {
  const MobileHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width : screenWidth,
      height: 750,
      child : Stack(
        clipBehavior: Clip.hardEdge,
        children    : [

          // ── Background ────────────────────────────
          const MobileHeroBg(),

          // ── Logo ──────────────────────────────────
          // top: 148 - 78(navbar) = 70, left: 98
          const Positioned(
            top : 70,
            left: 98,
            child: MobileHeroLogo(),
          ),

          // ── Title ─────────────────────────────────
          // top: 221 - 78 = 143, left: 22
          const Positioned(
            top : 143,
            left: 22,
            child: MobileHeroTitle(),
          ),

          // ── Phone image ───────────────────────────
          // top: 329 - 78 = 251, left: 83
          const Positioned(
            top : 251,
            left: 83,
            child: MobileHeroPhone(),
          ),

          // ── Play Now button ───────────────────────
          const Positioned(
            top  : 610,
            left : 0,
            right: 0,
            child: MobilePlayNowButton(),
          ),

        ],
      ),
    );
  }
}