import 'package:exous/view/screens/wallet_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../screens/billing_screen.dart'; // Adjust path if your folder nesting is different

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width : screenWidth,
      height: double.infinity,
      color : const Color(0xFF080818),
      child : Stack(
        children: [

          // ── Payment method card ───────────────────────
          // height increased to fit third button: 277 → 362
          Positioned(
            top : 184,
            left: 32.61,
            child: Container(
              width : 309.42,
              height: 362,
              decoration: BoxDecoration(
                color       : const Color(0xFF0F0F1E),
                borderRadius: BorderRadius.circular(16),
                border      : Border.all(
                  color: const Color(0xFF2A2A4A),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [

                  // ── Close X button ──────────────────
                  Positioned(
                    top  : 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width : 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color       : const Color(0xFF1A1A3A),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size : 14,
                        ),
                      ),
                    ),
                  ),

                  // ── Pay with card button ────────────
                  // top: 66.96, left: 40.18
                  Positioned(
                    top : 66.96,
                    left: 40.18,
                    child: _PaymentButton(
                      icon : Icons.credit_card_rounded,
                      label: 'Pay with card',
                      onTap: () {
                        Get.to(() => const BillingScreen());
                      },
                    ),
                  ),

                  // ── Pay with crypto button ──────────
                  // top: 151.76, left: 40.18
                  Positioned(
                    top : 151.76,
                    left: 40.18,
                    child: _PaymentButton(
                      icon : Icons.currency_bitcoin_rounded,
                      label: 'Pay with crypto',
                      onTap: () {
                        Get.to(() => const BillingScreen());
                      },
                    ),
                  ),

                  // ── Proceed to wallet pay button ────
                  // same spacing pattern: 151.76 - 66.96 = 84.8 gap
                  // top: 151.76 + 84.8 = 236.56, left: 40.18
                  Positioned(
                    top : 236.56,
                    left: 40.18,
                    child: _PaymentButton(
                      icon : Icons.account_balance_wallet_rounded,
                      label: 'Proceed to walletpay',
                      onTap: () {
                        Get.to(() => const WalletPayScreen());
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// ── Payment Button Widget Helper ──────────────────────────────────────
class _PaymentButton extends StatelessWidget {
  final IconData     icon;
  final String       label;
  final VoidCallback onTap;

  const _PaymentButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap   : onTap,
      child   : Container(
        width : 225.55,
        height: 61.06,
        decoration: BoxDecoration(
          color       : const Color(0xFF3853A4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children         : [
            Icon(
              icon,
              color: Colors.white,
              size : 22.35,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize  : 16.26,
                fontWeight: FontWeight.w600,
                color     : Colors.white,
                height    : 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}