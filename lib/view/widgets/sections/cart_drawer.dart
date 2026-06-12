// ignore_for_file: unnecessary_underscores, deprecated_member_use

import 'package:exous/view/screens/buy_now_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/cart_controller.dart';
import '../../../core/constants/app_images.dart';
 

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = Get.find<CartController>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: const Color(0xFF080818),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Navbar (same as home) ─────────────────
            Container(
              width  : double.infinity,
              height : 78,
              color  : const Color(0xFF131313),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child  : Row(
                children: [

                  // Logo
                  Image.asset(
                    AppImages.exodusLogoText,
                    width : 108,
                    height: 23.09,
                    fit   : BoxFit.contain,
                  ),

                  const SizedBox(width: 10),

                  // Orange circle
                  Image.asset(
                    AppImages.orangeCircle,
                    width : 22,
                    height: 22,
                    fit   : BoxFit.contain,
                  ),

                  const Spacer(),

                  // Cart icon (active state)
                  Stack(
                    clipBehavior: Clip.none,
                    children    : [
                      Container(
                        width : 39,
                        height: 35.82,
                        decoration: BoxDecoration(
                          color       : const Color(0xFF3853A4), // active
                          borderRadius: BorderRadius.circular(9.1),
                          border      : Border.all(
                            color: const Color(0xFF4463BF),
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.white,
                            size : 18,
                          ),
                        ),
                      ),
                      // Badge
                      Obx(() {
                        final count = controller.cartItems.fold<int>(
                          0, (s, i) => s + i.quantity.value,
                        );
                        if (count == 0) return const SizedBox.shrink();
                        return Positioned(
                          top  : -6,
                          right: -6,
                          child: Container(
                            width : 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Color(0xFF00AAFF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$count',
                                style: const TextStyle(
                                  fontSize  : 9,
                                  fontWeight: FontWeight.w700,
                                  color     : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),

                  const SizedBox(width: 8),

                  // Menu icon
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width : 39,
                      height: 35.82,
                      decoration: BoxDecoration(
                        color       : const Color(0xFF1565C0),
                        borderRadius: BorderRadius.circular(9.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical  : 9,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children         : [
                            _Line(width: double.infinity),
                            _Line(width: double.infinity),
                            _Line(width: 14),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Close X button ────────────────────────
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child  : GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width : 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color       : const Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(8),
                    border      : Border.all(
                      color: const Color(0xFF2A2A4A),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size : 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ── Cart items list ───────────────────────
            Expanded(
              child: Obx(() {

                if (controller.cartItems.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children         : [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white24,
                          size : 64,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Your cart is empty',
                          style: GoogleFonts.montserrat(
                            fontSize  : 16,
                            fontWeight: FontWeight.w500,
                            color     : Colors.white38,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add items from the Store',
                          style: GoogleFonts.montserrat(
                            fontSize  : 12,
                            color     : Colors.white24,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  padding         : const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  itemCount       : controller.cartItems.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: 10),
                  itemBuilder     : (_, index) {
                    final item = controller.cartItems[index];
                    return Obx(() => _CartItemCard(
                      screenWidth: screenWidth,
                      imageName  : item.imageName,
                      title      : item.title,
                      price      : item.price,
                      quantity   : item.quantity.value,
                      onIncrement: () => controller.increment(index),
                      onDecrement: () => controller.decrement(index),
                      onDelete   : () => controller.removeItem(index),
                    ));
                  },
                );
              }),
            ),

            // ── Footer ────────────────────────────────
            Obx(() => _CartFooter(
              totalPrice: controller.totalPrice,
              isCartEmpty: controller.cartItems.isEmpty,
              onClose   : () => Navigator.of(context).pop(),
            )),

          ],
        ),
      ),
    );
  }
}

// ── Cart Item Card ──────────────────────────────────────
class _CartItemCard extends StatelessWidget {
  final double       screenWidth;
  final String       imageName;
  final String       title;
  final double       price;
  final int          quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const _CartItemCard({
    required this.screenWidth,
    required this.imageName,
    required this.title,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height: 95,
      decoration: BoxDecoration(
        color       : const Color(0xFF0F0F1E),
        borderRadius: BorderRadius.circular(8),
        border      : Border.all(
          color: const Color(0xCC575C5F),
          width: 0.5,
        ),
      ),
      child: Stack(
        children: [

          Row(
            children: [

              // Tier image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft   : Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.asset(
                  imageName,
                  width : 90,
                  height: 90,
                  fit   : BoxFit.cover,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment : MainAxisAlignment.center,
                    children          : [

                      // Title
                      Text(
                        title.toUpperCase(),
                        style: GoogleFonts.montserrat(
                          fontSize  : 12,
                          fontWeight: FontWeight.w700,
                          color     : Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      // Price
                      Text(
                        '\$${price.toStringAsFixed(0)}',
                        style: GoogleFonts.montserrat(
                          fontSize  : 12,
                          fontWeight: FontWeight.w600,
                          color     : const Color(0xFF58CB11),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Qty controls
                      Row(
                        children: [

                          GestureDetector(
                            onTap: onDecrement,
                            child: Container(
                              width : 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1A1A3A),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size : 14,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Text(
                            '$quantity',
                            style: GoogleFonts.montserrat(
                              fontSize  : 14,
                              fontWeight: FontWeight.w700,
                              color     : Colors.white,
                            ),
                          ),

                          const SizedBox(width: 12),

                          GestureDetector(
                            onTap: onIncrement,
                            child: Container(
                              width : 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1A1A3A),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size : 14,
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),

          // Delete button
          Positioned(
            top  : 8,
            right: 8,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                width : 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xFF4463BF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size : 12,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// ── Cart Footer ─────────────────────────────────────────
class _CartFooter extends StatelessWidget {
  final double       totalPrice;
  final bool         isCartEmpty;
  final VoidCallback onClose;

  const _CartFooter({
    required this.totalPrice,
    required this.isCartEmpty,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color  : const Color(0xFF080818),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child  : Column(
        children: [

          // Total
          Text(
            'Total: \$${totalPrice.toStringAsFixed(0)}',
            style: GoogleFonts.montserrat(
              fontSize  : 22,
              fontWeight: FontWeight.w600,
              color     : Colors.white,
            ),
          ),

          const SizedBox(height: 14),

          // Checkout button
          SizedBox(
            width : double.infinity,
            height: 48,
            child : GestureDetector(
              onTap: isCartEmpty 
                ? null 
                : () {
                    // Close the drawer clean
                    Navigator.of(context).pop();
                    
                    // Simple clean routing without strict parameters
                    Get.to(() => const BuyNowScreen());
                  },
              child: Container(
                decoration: BoxDecoration(
                  color       : isCartEmpty ? Colors.grey.withOpacity(0.3) : const Color(0xFF3853A4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Checkout',
                    style: GoogleFonts.montserrat(
                      fontSize  : 18,
                      fontWeight: FontWeight.w600,
                      color     : isCartEmpty ? Colors.white30 : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Go to cart button
          SizedBox(
            width : double.infinity,
            height: 48,
            child : GestureDetector(
              onTap: onClose,
              child: Container(
                decoration: BoxDecoration(
                  color       : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border      : Border.all(
                    color: const Color(0xFF3853A4),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Go to cart',
                    style: GoogleFonts.montserrat(
                      fontSize  : 18,
                      fontWeight: FontWeight.w600,
                      color     : const Color(0xFF3853A4),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// ── Line (for hamburger menu) ───────────────────────────
class _Line extends StatelessWidget {
  final double width;
  const _Line({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width : width,
      height: 2,
      decoration: BoxDecoration(
        color       : Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}