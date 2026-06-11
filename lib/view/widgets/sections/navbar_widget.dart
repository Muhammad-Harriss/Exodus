// ignore_for_file: unnecessary_underscores

import 'package:exous/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exous/controllers/cart_controller.dart';

import 'cart_drawer.dart';
import 'drawer_menu.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Container(
      width: double.infinity,
      height: 78,
      color: const Color(0xFF131313),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.asset(
            AppImages.exodusLogoText,
            width: 108,
            height: 23.09,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 10),

          Image.asset(
            AppImages.orangeCircle,
            width: 22,
            height: 22,
            fit: BoxFit.contain,
          ),

          const Spacer(),

          // ── Cart icon with dynamic badge ──────────────
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _openCart(context),
            child: Obx(() {
              final count = cartController.cartItems.fold<int>(
                0,
                (sum, item) => sum + item.quantity.value,
              );

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 39,
                    height: 35.82,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E2E),
                      borderRadius: BorderRadius.circular(9.1),
                      border: Border.all(
                        color: const Color(0xFF2A2A4A),
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),

                  if (count > 0)
                    Positioned(
                      top: -6,
                      right: -6,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00AAFF),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),

          const SizedBox(width: 8),

          // ── Menu icon ─────────────────────────────────
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _openDrawer(context),
            child: const _MenuIcon(),
          ),
        ],
      ),
    );
  }

  // ── Open cart drawer ──────────────────────────────────
  void _openCart(BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        fullscreenDialog: true,
        opaque: true,
        pageBuilder: (_, __, ___) => const CartDrawer(),
        transitionsBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: anim,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  // ── Open drawer ───────────────────────────────────────
  void _openDrawer(BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        fullscreenDialog: true,
        opaque: true,
        pageBuilder: (_, __, ___) => const DrawerMenu(),
        transitionsBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: anim,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}

// ── Menu icon ───────────────────────────────────────────
class _MenuIcon extends StatelessWidget {
  const _MenuIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 35.82,
      decoration: BoxDecoration(
        color: const Color(0xFF1565C0),
        borderRadius: BorderRadius.circular(9.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 9,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _MenuLine(width: double.infinity),
            _MenuLine(width: double.infinity),
            _MenuLine(width: 14),
          ],
        ),
      ),
    );
  }
}

class _MenuLine extends StatelessWidget {
  final double width;

  const _MenuLine({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}