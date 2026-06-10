import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileHeroTitle extends StatelessWidget {
  const MobileHeroTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 327.92, height: 80.63
      // top: 221 - 78 = 143, left: 22
      width : 327.92,
      height: 80.63,
      child : Text(
        'Exodus Mobile Crypto\nMining Early Access April\n20th',
        textAlign: TextAlign.center,
        style    : GoogleFonts.montserrat(
          fontSize     : 22.28,
          fontWeight   : FontWeight.w700,
          color        : Colors.white,
          height       : 1.0,
          letterSpacing: 0,
        ),
      ),
    );
  }
}