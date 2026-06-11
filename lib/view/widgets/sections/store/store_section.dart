import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../controllers/cart_controller.dart';

class StoreSection extends StatelessWidget {
  const StoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final screenWidth    = MediaQuery.of(context).size.width;

    // ── Card width: (375 - left - gap - right) / 2
    // (375 - 16 - 10 - 16) / 2 = 166.5
    final cardWidth = (screenWidth - 42) / 2;

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 28),

          // ── "UPGRADE TIER" heading ────────────────────
          Text(
            'UPGRADE TIER',
            style: GoogleFonts.montserrat(
              fontSize     : 24,
              fontWeight   : FontWeight.w700,
              color        : Colors.white,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 24),

          // ── Tiers dropdown ────────────────────────────
          Container(
            width : 180,
            height: 44,
            decoration: BoxDecoration(
              color       : const Color(0xFF3853A4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children         : [
                Text(
                  'Tiers',
                  style: GoogleFonts.montserrat(
                    fontSize  : 18,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                  size : 22,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── Row 1: Tier 4 + Tier 3 ───────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child  : Row(
              children: [

                // Tier 4
                _StoreCard(
                  width      : cardWidth,
                  imageName  : AppImages.tier4,
                  title      : 'Tier 4 Upgrade',
                  price      : 95,
                  onAddToCart: () => cartController.addToCart(
                    imageName: AppImages.tier4,
                    title    : 'Tier 4 Upgrade',
                    price    : 95,
                  ),
                ),

                const SizedBox(width: 10),

                // Tier 3
                _StoreCard(
                  width      : cardWidth,
                  imageName  : AppImages.tier3,
                  title      : 'Tier 3 Upgrade',
                  price      : 95,
                  onAddToCart: () => cartController.addToCart(
                    imageName: AppImages.tier3,
                    title    : 'Tier 3 Upgrade',
                    price    : 95,
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 10),

          // ── Row 2: Tier 2 + Tier 1 ───────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child  : Row(
              children: [

                // Tier 2
                _StoreCard(
                  width      : cardWidth,
                  imageName  : AppImages.tier2,
                  title      : 'Tier 2 Upgrade',
                  price      : 95,
                  onAddToCart: () => cartController.addToCart(
                    imageName: AppImages.tier2,
                    title    : 'Tier 2 Upgrade',
                    price    : 95,
                  ),
                ),

                const SizedBox(width: 10),

                // Tier 1
                _StoreCard(
                  width      : cardWidth,
                  imageName  : AppImages.tier1,
                  title      : 'Tier 1 Upgrade',
                  price      : 95,
                  onAddToCart: () => cartController.addToCart(
                    imageName: AppImages.tier1,
                    title    : 'Tier 1 Upgrade',
                    price    : 95,
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 32),

        ],
      ),
    );
  }
}

// ── Store Card ──────────────────────────────────────────
class _StoreCard extends StatelessWidget {
  final double       width;
  final String       imageName;
  final String       title;
  final double       price;
  final VoidCallback onAddToCart;

  const _StoreCard({
    required this.width,
    required this.imageName,
    required this.title,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width : width,
      decoration: BoxDecoration(
        color       : const Color(0xFF0F0F1E),
        borderRadius: BorderRadius.circular(10),
        border      : Border.all(
          color: const Color(0xCC575C5F),
          width: 0.8,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical  : 14,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children         : [

            // ── Tier image ────────────────────────────
            Image.asset(
              imageName,
              width : width * 0.52,
              height: width * 0.52,
              fit   : BoxFit.contain,
            ),

            const SizedBox(height: 10),

            // ── Title ─────────────────────────────────
            Text(
              title,
              textAlign: TextAlign.center,
              style    : GoogleFonts.montserrat(
                fontSize  : 13,
                fontWeight: FontWeight.w700,
                color     : Colors.white,
                height    : 1.2,
              ),
            ),

            const SizedBox(height: 6),

            // ── Description ───────────────────────────
            Text(
              'Tier upgrade gives features to all upgrade service as well as an all exclusive battle pass',
              textAlign: TextAlign.center,
              style    : GoogleFonts.poppins(
                fontSize  : 9,
                fontWeight: FontWeight.w400,
                color     : Colors.white60,
                height    : 1.4,
              ),
            ),

            const SizedBox(height: 10),

            // ── Price row ─────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children         : [

                Text(
                  '\$${price.toStringAsFixed(0)}',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13,
                    fontWeight: FontWeight.w700,
                    color     : const Color(0xFF58CB11),
                  ),
                ),

                const SizedBox(width: 8),

                Text(
                  '\$150',
                  style: GoogleFonts.montserrat(
                    fontSize       : 13,
                    fontWeight     : FontWeight.w500,
                    color          : Colors.white38,
                    decoration     : TextDecoration.lineThrough,
                    decorationColor: Colors.white38,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 12),

            // ── Buttons row ───────────────────────────
            Row(
              children: [

                // Buy now button
                Expanded(
                  child: Container(
                    height    : 30,
                    decoration: BoxDecoration(
                      color       : const Color(0xFF3853A4),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'Buy now',
                        style: GoogleFonts.montserrat(
                          fontSize  : 10,
                          fontWeight: FontWeight.w600,
                          color     : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 6),

                // Add to cart button
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap   : onAddToCart,
                    child   : Container(
                      height    : 30,
                      decoration: BoxDecoration(
                        color       : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border      : Border.all(
                          color: const Color(0xFF4463BF),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: GoogleFonts.montserrat(
                            fontSize  : 10,
                            fontWeight: FontWeight.w600,
                            color     : const Color(0xFF4463BF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}