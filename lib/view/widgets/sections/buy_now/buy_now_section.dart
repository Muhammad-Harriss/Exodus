// ignore_for_file: unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exous/controllers/cart_controller.dart';

class BuyNowSection extends StatelessWidget {
  const BuyNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed overlapping issue by separating text parameters cleanly 
          Text(
            'SHOPPING CART',
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 24),

          Obx(() {
            if (controller.cartItems.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'Your cart is empty.',
                    style: GoogleFonts.montserrat(color: Colors.white54),
                  ),
                ),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.cartItems.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = controller.cartItems[index];

                // Dynamically apply a faint card background tint based on product tier type
                Color cardBg = const Color(0xFF130B1B); // Default Purple tint
                if (item.title.toLowerCase().contains('1')) {
                  cardBg = const Color(0xFF0B1710); // Green tint
                }

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Artwork Aspect Box
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item.imageName,
                          width: 85,
                          height: 85,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 14),

                      // Metadata and Interactive Column controls
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.title.toUpperCase(),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // Context Action Utilities (Trash & Wishlist)
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => controller.removeItem(index),
                                      child: const Icon(Icons.delete_outline, color: Colors.blueAccent, size: 18),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.favorite_border, color: Colors.blueAccent, size: 18),
                                  ],
                                )
                              ],
                            ),
                            
                            // Status tag line
                            Text(
                              'In stock',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),

                            // Product structural description 
                            Text(
                              "Tier upgrade gives features to all upgrade service as well as an all exclusive battle pass and many other rewards.",
                              style: GoogleFonts.montserrat(
                                fontSize: 10.5,
                                color: Colors.white70,
                                height: 1.3,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),

                            // Quantitative Interaction Module (Counter Stepper)
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (item.quantity.value > 1) item.quantity.value--;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(color: Color(0xFF1F223A), shape: BoxShape.circle),
                                    child: const Icon(Icons.remove, color: Colors.white, size: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    '${item.quantity.value}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => item.quantity.value++,
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(color: Color(0xFF1F223A), shape: BoxShape.circle),
                                    child: const Icon(Icons.add, color: Colors.white, size: 12),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Display Price details
                            Text(
                              'Price (1)',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                color: Colors.white38,
                              ),
                            ),
                            Text(
                              '\$${(item.price * item.quantity.value).toStringAsFixed(0)}',
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF22C55E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}