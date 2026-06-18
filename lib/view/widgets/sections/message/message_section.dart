// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controllers/cart_controller.dart';

class MessageSection extends StatefulWidget {
  const MessageSection({super.key});

  @override
  State<MessageSection> createState() => _MessageSectionState();
}

class _MessageSectionState extends State<MessageSection> {

  final _emailController   = TextEditingController();
  final _titleController   = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    if (_emailController.text.trim().isEmpty ||
        _titleController.text.trim().isEmpty ||
        _messageController.text.trim().isEmpty) {
      Get.snackbar(
        '⚠️ Missing Fields',
        'Please fill in all fields',
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
      return;
    }

    Get.snackbar(
      '✅ Message Sent',
      'Your message has been sent successfully',
      snackPosition  : SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF3853A4),
      colorText      : Colors.white,
      duration       : const Duration(seconds: 2),
    );

    _emailController.clear();
    _titleController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    // ── Single horizontal padding value used everywhere ───
    // This keeps the form card, headings, and tier block all
    // aligned to the same left/right edges consistently.
    const double sidePadding = 20;

    return Container(
      width: double.infinity,
      color: const Color(0xFF080818),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sidePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 20),

            // ── Message form card ────────────────────────
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color       : const Color(0xFF0D0D0D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                child  : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children          : [

                    // ── Email address label ───────────────
                    Text(
                      'Email address',
                      style: GoogleFonts.montserrat(
                        fontSize  : 12,
                        fontWeight: FontWeight.w500,
                        color     : const Color(0xFFFCFCFC),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ── Email input ────────────────────────
                    _FormInput(
                      controller: _emailController,
                      hint      : 'Example@gmail.com',
                    ),

                    const SizedBox(height: 16),

                    // ── Tittle message label ──────────────
                    Text(
                      'Tittle message',
                      style: GoogleFonts.montserrat(
                        fontSize  : 12,
                        fontWeight: FontWeight.w500,
                        color     : const Color(0xFFFCFCFC),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ── Title input ─────────────────────────
                    _FormInput(
                      controller: _titleController,
                      hint      : 'Message title',
                    ),

                    const SizedBox(height: 16),

                    // ── Type message here label ───────────
                    Text(
                      'Type message here',
                      style: GoogleFonts.montserrat(
                        fontSize  : 12,
                        fontWeight: FontWeight.w500,
                        color     : const Color(0xFFFCFCFC),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ── Message textarea ────────────────────
                    Container(
                      width : double.infinity,
                      height: 96,
                      decoration: BoxDecoration(
                        color       : Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(6),
                        border      : Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 0.8,
                        ),
                      ),
                      child: TextField(
                        controller: _messageController,
                        maxLines  : null,
                        expands   : true,
                        style     : GoogleFonts.montserrat(
                          fontSize  : 12,
                          fontWeight: FontWeight.w500,
                          color     : Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText      : 'Type here',
                          hintStyle     : GoogleFonts.montserrat(
                            fontSize  : 12,
                            fontWeight: FontWeight.w500,
                            color     : const Color(0x73FCFCFC),
                          ),
                          border        : InputBorder.none,
                          contentPadding: const EdgeInsets.fromLTRB(
                            14, 12, 14, 0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Send message button — full-width centered ──
                    Align(
                      alignment: Alignment.center,
                      child    : GestureDetector(
                        onTap: _handleSendMessage,
                        child: Container(
                          width : 170,
                          height: 44,
                          decoration: BoxDecoration(
                            color       : const Color(0xFF3853A4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Send message',
                              style: GoogleFonts.montserrat(
                                fontSize  : 14,
                                fontWeight: FontWeight.w600,
                                color     : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 36),

            // ── "Crypto mining tier" heading ───────────────
            Text(
              'Crypto mining tier',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize  : 19,
                fontWeight: FontWeight.w600,
                color     : const Color(0xFFFCFCFC),
              ),
            ),

            const SizedBox(height: 24),

            // ── Tier image + Upgrade Tier + Membership status ──
            Obx(() {

              final latestTier = cartController.latestTier;
              final isActive   = cartController.isLatestTierActive;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // ── Tier image (from cart) ────────────────
                  Container(
                    width : 96,
                    height: 96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: latestTier != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child       : Image.asset(
                              latestTier.imageName,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color       : const Color(0xFF1A1A2E),
                              borderRadius: BorderRadius.circular(10),
                              border      : Border.all(
                                color: const Color(0xFF2A2A4A),
                              ),
                            ),
                            child: const Icon(
                              Icons.diamond_outlined,
                              color: Colors.white24,
                              size : 38,
                            ),
                          ),
                  ),

                  const SizedBox(height: 22),

                  // ── Upgrade Tier button ────────────────────
                  Container(
                    width : 160,
                    height: 36,
                    decoration: BoxDecoration(
                      color       : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border      : Border.all(
                        color: const Color(0xFF3853A4),
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Upgrade Tier',
                        style: GoogleFonts.montserrat(
                          fontSize  : 12,
                          fontWeight: FontWeight.w500,
                          color     : const Color(0xFF6080DE),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ── "Membership status" heading ─────────────
                  Text(
                    'Membership status',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize  : 21,
                      fontWeight: FontWeight.w600,
                      color     : Colors.white,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ── Status text — ACTIVE / NOT ACTIVE ───────
                  Text(
                    isActive ? 'ACTIVE' : 'NOT ACTIVE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize  : 18,
                      fontWeight: FontWeight.w700,
                      color     : isActive
                          ? const Color(0xFF58CB11)
                          : const Color(0xFFE0492A),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Get membership button ───────────────────
                  Opacity(
                    opacity: 0.7,
                    child  : Container(
                      width : 190,
                      height: 40,
                      decoration: BoxDecoration(
                        color       : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border      : Border.all(
                          color: const Color(0xFF3A3A3A),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Get membership',
                          style: GoogleFonts.montserrat(
                            fontSize  : 13,
                            fontWeight: FontWeight.w500,
                            color     : const Color(0xFF8A8A8A),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              );
            }),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}

// ── Reusable form input field ───────────────────────────
class _FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const _FormInput({
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height: 42,
      decoration: BoxDecoration(
        color       : Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(6),
        border      : Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 0.8,
        ),
      ),
      child: TextField(
        controller: controller,
        style     : GoogleFonts.montserrat(
          fontSize  : 12,
          fontWeight: FontWeight.w500,
          color     : Colors.white,
        ),
        decoration: InputDecoration(
          hintText      : hint,
          hintStyle     : GoogleFonts.montserrat(
            fontSize  : 12,
            fontWeight: FontWeight.w500,
            color     : const Color(0x73FCFCFC),
          ),
          border        : InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        ),
      ),
    );
  }
}