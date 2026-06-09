import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Background ────────────────────────────────────────
  static const Color bgDark        = Color(0xFF080818);  // main bg
  static const Color bgCard        = Color(0xFF0F0F2A);  // card bg
  static const Color bgSection     = Color(0xFF0A0A1E);  // section bg
  static const Color bgNavbar      = Color(0xFF070714);  // navbar bg

  // ── Primary accents ───────────────────────────────────
  static const Color cyan          = Color(0xFF00D4FF);  // primary cyan
  static const Color cyanLight     = Color(0xFF4DE8FF);  // lighter cyan
  static const Color cyanDark      = Color(0xFF0099CC);  // darker cyan
  static const Color purple        = Color(0xFF6B35FF);  // primary purple
  static const Color purpleLight   = Color(0xFF8B5FFF);  // lighter purple
  static const Color purpleDark    = Color(0xFF4A1FCC);  // darker purple

  // ── Text ──────────────────────────────────────────────
  static const Color textWhite     = Color(0xFFFFFFFF);
  static const Color textGrey      = Color(0xFFAAAAAA);
  static const Color textDarkGrey  = Color(0xFF666680);
  static const Color textCyan      = Color(0xFF00D4FF);

  // ── Button gradients ──────────────────────────────────
  static const LinearGradient btnGradient = LinearGradient(
    colors: [cyan, purple],
    begin : Alignment.centerLeft,
    end   : Alignment.centerRight,
  );

  static const LinearGradient btnGradientVertical = LinearGradient(
    colors: [cyanLight, purple],
    begin : Alignment.topCenter,
    end   : Alignment.bottomCenter,
  );

  // ── Hero background gradient ──────────────────────────
  static const LinearGradient heroBg = LinearGradient(
    begin  : Alignment.topCenter,
    end    : Alignment.bottomCenter,
    colors : [
      Color(0xFF1A1A4E),   // dark blue top
      Color(0xFF0D0D2B),   // darker mid
      Color(0xFF080818),   // black bottom
    ],
  );

  // ── Card gradient ─────────────────────────────────────
  static const LinearGradient cardGradient = LinearGradient(
    begin  : Alignment.topLeft,
    end    : Alignment.bottomRight,
    colors : [
      Color(0xFF151535),
      Color(0xFF0F0F28),
    ],
  );

  // ── Borders ───────────────────────────────────────────
  static const Color borderCyan    = Color(0xFF00D4FF);
  static const Color borderPurple  = Color(0xFF6B35FF);
  static const Color borderDark    = Color(0xFF1E1E3E);
  static const Color borderGrey    = Color(0xFF2A2A4A);

  // ── Divider ───────────────────────────────────────────
  static const Color divider       = Color(0xFF1A1A3A);

  // ── FAQ ───────────────────────────────────────────────
  static const Color faqBg         = Color(0xFF0F0F25);
  static const Color faqBorder     = Color(0xFF1E1E3E);

  // ── Input fields ──────────────────────────────────────
  static const Color inputBg       = Color(0xFF0F0F25);
  static const Color inputBorder   = Color(0xFF2A2A4A);
  static const Color inputHint     = Color(0xFF555570);

  // ── Coming soon section ───────────────────────────────
  static const Color comingSoonBg  = Color(0xFFFFFFFF);  // white section
  static const Color comingSoonText = Color(0xFF111111);

  // ── Partners section ──────────────────────────────────
  static const Color partnerBg     = Color(0xFFFFFFFF);

  // ── Overlay ───────────────────────────────────────────
  static const Color overlay       = Color(0x88000000);

  // ── Glow effects ─────────────────────────────────────
  static const Color glowCyan      = Color(0x4400D4FF);
  static const Color glowPurple    = Color(0x446B35FF);
}