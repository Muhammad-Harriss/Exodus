import 'package:exous/view/widgets/sections/billing/billing_section.dart';
import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/mobile_app/mobile_bottom_bar.dart';

class BillingSupportScreen extends StatelessWidget {
  const BillingSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),

      bottomNavigationBar: const MobileBottomBar(
        activeTab: 'billing',
      ),

      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child  : Column(
          children: [

            // ── 1. Navbar ──────────────────────────────
            const NavbarWidget(),

            // ── 2. Billing support section ─────────────
            const BillingSection(),

          ],
        ),
      ),
    );
  }
}