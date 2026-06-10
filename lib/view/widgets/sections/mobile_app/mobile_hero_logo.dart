import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';

class MobileHeroLogo extends StatelessWidget {
  const MobileHeroLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.exodusHeroLogo,
      // width: 177.74, height: 38
      // top: 148 - 78 = 70, left: 98
      width : 177.74,
      height: 38,
      fit   : BoxFit.contain,
    );
  }
}