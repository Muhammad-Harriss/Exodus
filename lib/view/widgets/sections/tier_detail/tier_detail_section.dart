import 'package:exous/view/screens/buy_now_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../controllers/cart_controller.dart';

class TierDetailSection extends StatelessWidget {
  final String imageName;
  final String title;
  final double price;

  const TierDetailSection({
    super.key,
    required this.imageName,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final screenWidth    = MediaQuery.of(context).size.width;

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.only(left: 27),
            child  : GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width : 145.23,
                height: 38.79,
                decoration: BoxDecoration(
                  color       : const Color(0xFF0F0F1E),
                  borderRadius: BorderRadius.circular(8),
                  border      : Border.all(
                    color: const Color(0xFF2A2A4A),
                    width: 0.8,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children         : [
                    const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size : 12,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Back to shop',
                      style: GoogleFonts.montserrat(
                        fontSize  : 13.78,
                        fontWeight: FontWeight.w500,
                        color     : Colors.white,
                        height    : 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.only(left: 11),
            child  : Container(
              width : 351,
              decoration: BoxDecoration(
                color       : const Color(0xFF0F0F1E),
                borderRadius: BorderRadius.circular(12),
                border      : Border.all(
                  color: const Color(0xCC575C5F),
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child  : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children          : [

                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child       : Image.asset(
                          imageName,
                          width : 175,
                          height: 175,
                          fit   : BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      title.toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontSize  : 28.86,
                        fontWeight: FontWeight.w600,
                        color     : const Color(0xFFFFFFFF),
                        height    : 1.0,
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: 282.28,
                      child: Text(
                        'Tier 4 upgrade gives features to all upgrade service as well as an all exclusive battle pass and many other rewards Tier 4 upgrade gives features to all upgrade service as well as an all exclusive battle pass and many other rewards',
                        style: GoogleFonts.poppins(
                          fontSize  : 12.32,
                          fontWeight: FontWeight.w400,
                          color     : const Color(0xB2FFFFFF),
                          height    : 1.8,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Text(
                          '\$${price.toStringAsFixed(0)}',
                          style: GoogleFonts.montserrat(
                            fontSize  : 32.4,
                            fontWeight: FontWeight.w600,
                            color     : const Color(0xFF58CB11),
                            height    : 1.0,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '\$150',
                          style: GoogleFonts.montserrat(
                            fontSize       : 32.4,
                            fontWeight     : FontWeight.w500,
                            color          : Colors.white38,
                            height         : 1.0,
                            decoration     : TextDecoration.lineThrough,
                            decorationColor: Colors.white38,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [

                        // ── Fixed Buy Now Navigation inside Detail section ──
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap   : () {
                            // 1. Instantly register item in user's reactive controller list
                            cartController.addToCart(
                              imageName: imageName,
                              title    : title,
                              price    : price,
                            );
                            // 2. Perform parameterless page push
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (_) => const BuyNowScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width : 138.43,
                            height: 46.95,
                            decoration: BoxDecoration(
                              color       : const Color(0xFF3853A4),
                              borderRadius: BorderRadius.circular(8.6),
                            ),
                            child: Center(
                              child: Text(
                                'Buy now',
                                style: GoogleFonts.montserrat(
                                  fontSize  : 14.9,
                                  fontWeight: FontWeight.w600,
                                  color     : Colors.white,
                                  height    : 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Add to cart button
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap   : () => cartController.addToCart(
                            imageName: imageName,
                            title    : title,
                            price    : price,
                          ),
                          child: Container(
                            width : 138.43,
                            height: 46.95,
                            decoration: BoxDecoration(
                              color       : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.6),
                              border      : Border.all(
                                color: const Color(0xFF4463BF),
                                width: 1.2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Add to cart',
                                style: GoogleFonts.montserrat(
                                  fontSize  : 14.9,
                                  fontWeight: FontWeight.w600,
                                  color     : const Color(0xFF4463BF),
                                  height    : 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 20),

                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

        ],
      ),
    );
  }
}