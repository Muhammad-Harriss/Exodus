import 'package:exous/view/screens/billing_support_screen.dart';
import 'package:exous/view/screens/bridge_coin_screen.dart';
import 'package:exous/view/screens/message_mobile_screen.dart';
import 'package:exous/view/screens/prefrences_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileBottomBar extends StatelessWidget {
  final String activeTab;

  const MobileBottomBar({
    super.key,
    this.activeTab = 'message',
  });

  @override
  Widget build(BuildContext context) {
    final isMessageActive  = activeTab == 'message';
    final isPrefsActive    = activeTab == 'preferences';
    final isBillingActive  = activeTab == 'billing';

    return Container(
      width  : double.infinity,
      height : 64,
      color  : const Color(0xFF0A0A0A),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child  : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children         : [

          // ── Message ───────────────────────────────────
          GestureDetector(
            onTap: () {
              if (isMessageActive) return;
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => const MessageMobileScreen(),
                ),
              );
            },
            child: isMessageActive
                ? _ActivePill(
                    icon : Icons.chat_bubble_outline_rounded,
                    label: 'Message',
                  )
                : const Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: Colors.white,
                    size : 24,
                  ),
          ),

          // ── Preferences ───────────────────────────────
          GestureDetector(
            onTap: () {
              if (isPrefsActive) return;
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => const PreferencesScreen(),
                ),
              );
            },
            child: isPrefsActive
                ? _ActivePill(
                    icon : Icons.person_rounded,
                    label: 'Preferences',
                  )
                : const Icon(
                    Icons.person_outline_rounded,
                    color: Colors.white,
                    size : 24,
                  ),
          ),

          // ── Billing ───────────────────────────────────
          GestureDetector(
            onTap: () {
              if (isBillingActive) return;
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => const BillingSupportScreen(),
                ),
              );
            },
            child: isBillingActive
                ? _ActivePill(
                    icon : Icons.credit_card_rounded,
                    label: 'Billing support',
                  )
                : const Icon(
                    Icons.credit_card_outlined,
                    color: Colors.white,
                    size : 22,
                  ),
          ),

          // ── Swap/transfer ──────────────────────────────
GestureDetector(
  onTap: () {
    if (activeTab == 'bridge_coin') return;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => const BridgeCoinScreen(),
      ),
    );
  },
  child: activeTab == 'bridge_coin'
      ? _ActivePill(
          icon : Icons.swap_horiz_rounded,
          label: 'Bridge coin',
        )
      : const Icon(
          Icons.swap_horiz_rounded,
          color: Colors.white,
          size : 24,
        ),
),
        ],
      ),
    );
  }
}

// ── Active tab pill ─────────────────────────────────────
class _ActivePill extends StatelessWidget {
  final IconData icon;
  final String   label;

  const _ActivePill({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height : 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color       : const Color(0xFF3853A4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children         : [
          Icon(
            icon,
            color: Colors.white,
            size : 17,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize  : 13,
              fontWeight: FontWeight.w600,
              color     : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}