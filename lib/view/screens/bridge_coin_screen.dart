// ignore_for_file: unnecessary_underscores, deprecated_member_use

import 'dart:ui';
import 'package:exous/view/widgets/sections/mobile_app/mobile_bottom_bar.dart';
import 'package:exous/view/widgets/sections/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BridgeCoinScreen extends StatefulWidget {
  const BridgeCoinScreen({super.key});

  @override
  State<BridgeCoinScreen> createState() => _BridgeCoinScreenState();
}

class _BridgeCoinScreenState extends State<BridgeCoinScreen> {
  // State management tracking tab selections (Deposit vs Withdraw)
  bool isDepositSelected = false; // Defaults to false (Withdraw active)

  // Controller to dynamically grab numbers written in the field matrix block
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose(); // Clean up controller memory allocations
    super.dispose();
  }

  // ── Blur Pop-up Dialog Builder ──────────────────────────────────────
  void _showTransactionCompletedDialog(BuildContext dialogContext, String amount) {
    // If the field was left empty, default back safely to "0" or your placeholder text
    final displayAmount = amount.trim().isEmpty ? "0" : amount;

    showDialog(
      context: dialogContext,
      barrierDismissible: false, // Prevents closing by accidental backdrop taps
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 350,
              height: 367,
              decoration: BoxDecoration(
                color: const Color(0xFF111112), 
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ── Blue Tick Circle Indicator ──
                  Container(
                    width: 44.37,
                    height: 44.37,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3853A4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Title Header ──
                  Text(
                    'Transaction completed',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 19.12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ── Dynamic Coin Status Subtext ──
                  SizedBox(
                    width: 279,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Image.asset(
                                'assets/images/coin_gold.png',
                                height: 16,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.monetization_on, 
                                  color: Colors.amber, 
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: '$displayAmount has been deposited to your\nexodus account',
                            style: GoogleFonts.montserrat(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF).withOpacity(0.85),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Done Action Button ──
                  SizedBox(
                    width: 121.87,
                    height: 32.54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3853A4).withOpacity(0.17), // #3853A42B equivalent
                        side: BorderSide(color: const Color(0xFF4463BF).withOpacity(0.3), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.57),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Closes dialog panel interface safely
                      },
                      child: Text(
                        'Done',
                        style: GoogleFonts.montserrat(
                          fontSize: 11.57,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF4463BF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body: SafeArea(
        child: Column(
          children: [
            // ── Top App Navigation Block ──────────────────
            const NavbarWidget(),

            // ── Main Interface Content Panel ───────────────
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 16, 6, 12),
                  child: Column(
                    children: [
                      
                      // ── Main Section Block (width: ~350, height: ~367) ──
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A0A0A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 18),
                            
                            // ── Sub-Tab Configuration Selection ────
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Deposit Selection Button Toggle
                                GestureDetector(
                                  onTap: () => setState(() => isDepositSelected = true),
                                  child: Text(
                                    'Deposit',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.89,
                                      fontWeight: FontWeight.w500,
                                      color: isDepositSelected 
                                          ? const Color(0xFF506FCE) 
                                          : Colors.white.withOpacity(0.75),
                                    ),
                                  ),
                                ),
                                // Withdraw Selection Button Toggle
                                GestureDetector(
                                  onTap: () => setState(() => isDepositSelected = false),
                                  child: Text(
                                    'Withdraw',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.89,
                                      fontWeight: FontWeight.w500,
                                      color: !isDepositSelected 
                                          ? const Color(0xFF506FCE) 
                                          : Colors.white.withOpacity(0.75),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 14),
                            
                            // Linear Divider Separator Line
                            Container(
                              height: 0.66,
                              width: double.infinity,
                              color: const Color(0xFF383838),
                            ),
                            const SizedBox(height: 24),

                            // ── Asset Header Balances Grid ─────────────────
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Brand Layout Reference
                                  Image.asset(
                                    'assets/images/white_logo.png',
                                    height: 25,
                                    errorBuilder: (_, __, ___) => const Icon(Icons.blur_on_rounded, color: Colors.white),
                                  ),
                                  // Gold Coin Matrix Readout Alignment 
                                  Row(
                                    children: [
                                      Text(
                                        'Balance: ',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.48,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Image.asset(
                                        'assets/images/coin_gold.png',
                                        height: 16,
                                        errorBuilder: (_, __, ___) => const Icon(Icons.monetization_on, color: Colors.amber, size: 16),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '1976.87',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.48,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 12),

                            // ── Editable Amount Field Container with "Matic" on the Left ──
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Container(
                                height: 44.71,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFF383838), width: 0.71),
                                  borderRadius: BorderRadius.circular(8.52),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 14),
                                child: Row(
                                  children: [
                                    // Left Side: Token indicator dropdown elements
                                    Row(
                                      children: [
                                        Text(
                                          'Matic',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 13.48,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFFCFCFC),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white70, size: 16),
                                      ],
                                    ),
                                    const SizedBox(width: 12),
                                    
                                    // Middle: Numeric input field tracking live user entries
                                    Expanded(
                                      child: TextField(
                                        controller: _amountController,
                                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                        cursorColor: const Color(0xFF506FCE),
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.48,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFFFCFCFC),
                                        ),
                                        decoration: InputDecoration(
                                          hintText: '0.00',
                                          hintStyle: GoogleFonts.montserrat(
                                            fontSize: 13.48,
                                            color: Colors.white38,
                                          ),
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    
                                    // Right Side: Max action trigger button
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _amountController.text = "1976.87"; // Auto-fills max balance value
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF58CB11).withOpacity(0.11), 
                                          borderRadius: BorderRadius.circular(5.68),
                                        ),
                                        child: Text(
                                          'Max',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.65,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF58CB11),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // ── Central Transfer Vector Node Circle ───────
                            Container(
                              width: 30.41,
                              height: 30.41,
                              decoration: const BoxDecoration(
                                color: Color(0xFF131722),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_downward_rounded,
                                color: Color(0xFF506FCE),
                                size: 16,
                              ),
                            ),

                            const SizedBox(height: 12),

                            // ── Destination Chain/Network Readout Banner ──
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Container(
                                height: 44.71,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF141414),
                                  borderRadius: BorderRadius.circular(8.52),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Polygon chain',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 11.9,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFCFCFC).withOpacity(0.9),
                                      ),
                                    ),
                                    Text(
                                      'Balance: \$1976.87',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 11.9,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // ── Primary Action Interaction Button with explicitly active context builder ──
                            Builder(
                              builder: (buttonContext) {
                                return SizedBox(
                                  width: 156.71,
                                  height: 39.67,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF3853A4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.04),
                                      ),
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      // Using buttonContext explicitly ensures showDialog receives a perfectly linked view tree
                                      _showTransactionCompletedDialog(buttonContext, _amountController.text);
                                    },
                                    child: Text(
                                      'Transfer',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.71,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MobileBottomBar(activeTab: 'bridge_coin'),
    );
  }
}