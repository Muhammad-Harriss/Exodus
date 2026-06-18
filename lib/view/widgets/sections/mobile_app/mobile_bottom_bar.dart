import 'package:exous/view/screens/message_mobile_screen.dart';
import 'package:exous/view/screens/prefrences_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileBottomBar extends StatelessWidget {
  /// Pass the current screen's tab key so the matching item
  /// can be visually highlighted in blue. Defaults to 'message'
  /// since that's the original always-blue button.
  final String activeTab;

  const MobileBottomBar({
    super.key,
    this.activeTab = 'message',
  });

  @override
  Widget build(BuildContext context) {
    final isMessageActive     = activeTab == 'message';
    final isPreferencesActive = activeTab == 'preferences';

    return Container(
      width: double.infinity,
      height: 64,
      color: const Color(0xFF0A0A0A),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Message button ───────────────────────────
          GestureDetector(
            onTap: () {
              if (isMessageActive) return;
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (_) => const MessageMobileScreen()),
              );
            },
            child: isMessageActive
                ? Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3853A4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: Colors.white,
                          size: 17,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Message',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : const Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
          ),

          // ── Person / Preferences button ──────────────
          GestureDetector(
            onTap: () {
              if (isPreferencesActive) return;
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (_) => const PreferencesScreen()),
              );
            },
            child: isPreferencesActive
                ? Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3853A4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 17,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Preferences',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : const Icon(
                    Icons.person_outline_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
          ),

          // ── Card icon ─────────────────────────────────
          const Icon(Icons.credit_card_outlined, color: Colors.white, size: 22),

          // ── Swap/transfer icon ────────────────────────
          const Icon(Icons.swap_horiz_rounded, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}