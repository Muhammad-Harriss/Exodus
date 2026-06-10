// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobilePlayNowButton extends StatelessWidget {
  const MobilePlayNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width from figma: button text width: 32.11, height: 19.80
        // container sized for proper button appearance
        width : 180,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient    : const RadialGradient(
            // radial-gradient(56.33% 91.33% at 38.51% 31.53%
            // #C3D0E3 0%, #696F7D 100%)
            center     : Alignment(-0.23, -0.37),
            radius     : 0.92,
            focal      : Alignment(-0.23, -0.37),
            focalRadius: 0.56,
            colors     : [
              Color.fromARGB(255, 76, 158, 224),
              Color.fromARGB(255, 53, 162, 235),
            ],
            stops: [0.0, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color     : Colors.black.withOpacity(0.3),
              blurRadius: 12,
              offset    : const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'PLAY NOW',
            style: GoogleFonts.montserrat(
              fontSize     : 16,
              fontWeight   : FontWeight.w700,
              color        : Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}