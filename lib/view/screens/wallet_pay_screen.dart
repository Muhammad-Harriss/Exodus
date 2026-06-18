import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/wallet_pay/wallet_pay_section.dart';

class WalletPayScreen extends StatelessWidget {
  const WalletPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body           : SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child  : Column(
          children: [

            // ── 1. Navbar ────────────────────────────────
            const NavbarWidget(),

            // ── 2. Wallet pay content section ─────────────
            const WalletPaySection(),

          ],
        ),
      ),
    );
  }
}