import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/message/message_section.dart';
import '../widgets/sections/mobile_app/mobile_bottom_bar.dart';

class MessageMobileScreen extends StatelessWidget {
  const MessageMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),

      // ── Persistent bottom bar — Message tab highlighted ──
      bottomNavigationBar: const MobileBottomBar(
        activeTab: 'message',
      ),

      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child  : Column(
          children: [

            // ── 1. Navbar ──────────────────────────────
            const NavbarWidget(),

            // ── 2. Message section ─────────────────────
            const MessageSection(),

          ],
        ),
      ),
    );
  }
}