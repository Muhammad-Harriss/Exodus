import 'package:exous/view/widgets/sections/wallet_pay/wallet_pay_detail.section.dart';
import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';

class WalletPayDetailScreen extends StatelessWidget {
  const WalletPayDetailScreen({super.key});

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

            // ── 2. Wallet pay detail content ──────────────
            const WalletPayDetailSection(),

          ],
        ),
      ),
    );
  }
}