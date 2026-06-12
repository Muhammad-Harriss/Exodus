import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/buy_now/buy_now_section.dart';
import '../../controllers/cart_controller.dart';

class BuyNowScreen extends StatelessWidget {
  const BuyNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: const Color(0xFF080818),

      // ── Bottom Fixed Checkout Navigation ──────────────────────────
      bottomNavigationBar: Obx(() {
        final total = controller.totalPrice;

        return Container(
          color: const Color(0xFF080818),
          child: SafeArea(
            top: false,
            child: Container(
              height: 76,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total: \$${total.toStringAsFixed(0)}',
                    style: GoogleFonts.montserrat(
                      fontSize: 18.44,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 144.77,
                    height: 47.03,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3853A4),
                      borderRadius: BorderRadius.circular(9.53),
                    ),
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),

      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── 1. Header Navigation ───────────────────────────
              const NavbarWidget(),
              
              const SizedBox(height: 10),

              // ── 2. Back Action Button ──────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF131A32),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_back_ios, color: Color(0xFF3853A4), size: 14),
                        const SizedBox(width: 6),
                        Text(
                          'Back to shop',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFF3853A4),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ── 3. Main Dynamic Content Section ────────────────
              const BuyNowSection(),
            ],
          ),
        ),
      ),
    );
  }
}