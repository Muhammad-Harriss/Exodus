// ignore_for_file: unnecessary_underscores, deprecated_member_use

import 'package:exous/controllers/navigation_controller.dart';
import 'package:exous/controllers/auth_controller.dart';
import 'package:exous/core/constants/app_images.dart';
import 'package:exous/view/screens/high_score_screen.dart';
import 'package:exous/view/screens/wallet_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../screens/mobile_app_screen.dart';
import '../../screens/store_screen.dart';
import '../../screens/home_screen.dart';


class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Find the global navigation controller instance
    final navController  = Get.find<NavigationController>();
    final authController = Get.find<AuthController>();

    return Material(
      color: const Color(0xFF080818),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Top navbar ─────────────────────────────
            Container(
              height : 78,
              color  : const Color(0xFF131313),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child  : Row(
                children: [
                  Image.asset(
                    AppImages.exodusLogoText,
                    width : 108,
                    height: 23.09,
                    fit   : BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    AppImages.orangeCircle,
                    width : 22,
                    height: 22,
                    fit   : BoxFit.contain,
                  ),
                  const Spacer(),

                  // ── Cart ─────────────────────────────
                  Stack(
                    clipBehavior: Clip.none,
                    children    : [
                      Container(
                        width : 39,
                        height: 35.82,
                        decoration: BoxDecoration(
                          color       : const Color(0xFF1E1E2E),
                          borderRadius: BorderRadius.circular(9.1),
                          border      : Border.all(
                            color: const Color(0xFF2A2A4A),
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size : 18,
                          ),
                        ),
                      ),
                      Positioned(
                        top  : -6,
                        right: -6,
                        child: Container(
                          width : 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            color: Color(0xFF00AAFF),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontSize  : 9,
                                fontWeight: FontWeight.w700,
                                color     : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),

                  // ── Menu icon active ──────────────────
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width : 39,
                      height: 35.82,
                      decoration: BoxDecoration(
                        color       : const Color(0xFF3853A4),
                        borderRadius: BorderRadius.circular(9.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical  : 9,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children          : [
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
                child: const Text(
                  '✕',
                  style: TextStyle(
                    fontSize  : 22,
                    color     : Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Menu items — all centered ──────────────
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children          : [

                    // ── Mobile app Tab ──────────────────
                    Obx(() => _MenuItem(
                      text    : 'Mobile app',
                      isActive: navController.currentTab.value == 'Mobile app',
                      onTap   : () {
                        navController.changeTab('Mobile app');
                        Navigator.of(context).pop();
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).push(
                          MaterialPageRoute(
                            builder: (_) => const MobileAppScreen(),
                          ),
                        );
                      },
                    )),
                    const SizedBox(height: 28),

                    // ── Home Tab ─────────────────────────
                    Obx(() => _MenuItem(
                      text    : 'Home',
                      isActive: navController.currentTab.value == 'Home',
                      onTap   : () {
                        navController.changeTab('Home');
                        Navigator.of(context).pop();
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    )),
                    const SizedBox(height: 28),

                    // ── News Tab ─────────────────────────
                    Obx(() => _MenuItem(
                      text    : 'News',
                      isActive: navController.currentTab.value == 'News',
                      onTap   : () {
                        navController.changeTab('News');
                        Navigator.of(context).pop();
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const WalletPayScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    )),
                    const SizedBox(height: 28),

                    // ── Store Tab ────────────────────────
                    Obx(() => _MenuItem(
                      text    : 'Store',
                      isActive: navController.currentTab.value == 'Store',
                      onTap   : () {
                        navController.changeTab('Store');
                        Navigator.of(context).pop();
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).push(
                          MaterialPageRoute(
                            builder: (_) => const StoreScreen(),
                          ),
                        );
                      },
                    )),
                    const SizedBox(height: 28),

                    // ── Highscore Tab ────────────────────
                    Obx(() => _MenuItem(
                      text    : 'Highscore',
                      isActive: navController.currentTab.value == 'Highscore',
                      onTap   : () {
                        navController.changeTab('Highscore');
                        Navigator.of(context).pop(); // Closes the overlay panel smoothly before jumping
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).push(
                          MaterialPageRoute(
                            builder: (_) => const HighscoreScreen(),
                          ),
                        );
                      },
                    )),
                    const SizedBox(height: 28),

                    // ── Play now Tab ──────────────────────
                    Obx(() => _MenuItem(
                      text    : 'Play now',
                      isActive: navController.currentTab.value == 'Play now',
                      onTap   : () {
                        navController.changeTab('Play now');
                      },
                    )),
                    const SizedBox(height: 28),

                    // ── Logout Tab ────────────────────────
                    _MenuItem(
                      text    : 'Log out',
                      isActive: false,
                      onTap   : () {
                        Navigator.of(context).pop();
                        authController.logout();
                      },
                    ),

                    const SizedBox(height: 56),

                    // ── Joshua row — circular avatar ──────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children         : [

                        ClipOval(
                          child: Image.asset(
                            AppImages.partnerjoshua,
                            width : 44,
                            height: 44,
                            fit   : BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Text(
                          'JoshuaJTV',
                          style: GoogleFonts.montserrat(
                            fontSize     : 20.23,
                            fontWeight   : FontWeight.w500,
                            color        : const Color(0xFF4463BF),
                            height       : 1.0,
                            letterSpacing: 0,
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 32),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// ── Menu Item ───────────────────────────────────────────
class _MenuItem extends StatelessWidget {
  final String        text;
  final bool           isActive;
  final VoidCallback?  onTap;

  const _MenuItem({
    required this.text,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style    : GoogleFonts.montserrat(
          fontSize     : 19.21,
          fontWeight   : isActive ? FontWeight.w700 : FontWeight.w500,
          color        : isActive
              ? const Color(0xFF4463BF)
              : const Color(0xFFFFFFFF),
          height       : 1.0,
          letterSpacing: 0,
        ),
      ),
    );
  }
}

// ── Line ────────────────────────────────────────────────
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