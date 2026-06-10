import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';

class MobileHeroPhone extends StatelessWidget {
  const MobileHeroPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.heroPhone,
      // width: 209, height: 341
      // top: 329 - 78 = 251, left: 83
      width : 209,
      height: 341,
      fit   : BoxFit.contain,
    );
  }
}