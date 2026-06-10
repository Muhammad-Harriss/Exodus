// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';

class MobileHeroBg extends StatelessWidget {
  const MobileHeroBg({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [

        // ── Background image ─────────────────────────
        Positioned(
          top : 0,
          left: -(1435 - screenWidth) / 2 - 150,
          child: Image.asset(
            AppImages.heroBg,
            width : 1435,
            height: 750,
            fit   : BoxFit.cover,
          ),
        ),

        // ── Dark gradient overlay ─────────────────────
        Positioned(
          top   : 0,
          left  : 0,
          right : 0,
          bottom: 0,
          child : Container(
            width : screenWidth,
            height: 750,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin : Alignment.topCenter,
                end   : Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.35),
                  Colors.black.withOpacity(0.60),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}