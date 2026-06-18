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
                // ✅ item is read here, fine outside inner Obx
                final item = controller.cartItems[index];

                Color cardBg = const Color(0xFF130B1B);
                if (item.title.toLowerCase().contains('1')) {
                  cardBg = const Color(0xFF0B1710);
                }

                // ✅ wrap the reactive parts (qty, favourite) in their own Obx
                return Obx(() {
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

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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

                                  // ── Delete + Favourite ──────────
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            controller.removeItem(index),
                                        child: const Icon(
                                          Icons.delete_outline,
                                          color: Colors.blueAccent,
                                          size: 18,
                                        ),
                                      ),
                                      const SizedBox(width: 10),

                                      // ✅ now connected to toggleFavourite
                                      GestureDetector(
                                        onTap: () => controller
                                            .toggleFavourite(index),
                                        child: Icon(
                                          item.isFavourite.value
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_border,
                                          color: item.isFavourite.value
                                              ? const Color(0xFFFF4D6D)
                                              : Colors.blueAccent,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                              Text(
                                'In stock',
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 6),

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

                              // ── Qty stepper — uses controller methods ──
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        controller.decrement(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF1F223A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
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
                                    onTap: () =>
                                        controller.increment(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF1F223A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // ✅ dynamic quantity instead of hardcoded "(1)"
                              Text(
                                'Price (${item.quantity.value})',
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
                });
              },
            );
          }),

          const SizedBox(height: 24),

          // ── Total + checkout, shown only when cart has items ──
          Obx(() {
            if (controller.cartItems.isEmpty) {
              return const SizedBox.shrink();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: \$${controller.totalPrice.toStringAsFixed(0)}',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to PaymentMethodScreen or your checkout flow
                      Navigator.of(context).pushNamed('/payment-method');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3853A4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),

        ],
      ),
    );
  }
}