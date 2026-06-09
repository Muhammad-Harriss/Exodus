// ignore_for_file: unnecessary_underscores

import 'package:exous/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'drawer_menu.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('🔵 NavbarWidget build called');

    return Container(
      width  : double.infinity,
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

          _CartIcon(),

          const SizedBox(width: 8),

          // ── Menu button ───────────────────────────────
          GestureDetector(
            behavior: HitTestBehavior.opaque,  // ← ensures tap is detected
            onTap   : () {
              print('🔴 Menu button tapped');
              _openDrawer(context);
            },
            child: _MenuIcon(),
          ),

        ],
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    print('🟡 _openDrawer called');
    print('🟡 context mounted: ${context.mounted}');

    try {
      print('🟢 Attempting Navigator push...');

      Navigator.of(context, rootNavigator: true).push(
        PageRouteBuilder(
          fullscreenDialog  : true,
          opaque            : true,
          pageBuilder: (ctx, animation, secondaryAnimation) {
            print('🟢 DrawerMenu pageBuilder called');
            return const DrawerMenu();
          },
          transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end  : Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve : Curves.easeInOut,
              )),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );

      print('🟢 Navigator push completed');

    } catch (e, stack) {
      print('🔴 ERROR in _openDrawer: $e');
      print('🔴 StackTrace: $stack');
    }
  }
}

// ── Cart icon ───────────────────────────────────────────
class _CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

// ── Menu icon ───────────────────────────────────────────
class _MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('🔵 MenuIcon build called');
    return Container(
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
  const _MenuLine({required this.width});

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