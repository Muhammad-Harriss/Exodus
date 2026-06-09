import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ── EXODUS hero title ─────────────────────────────────
  static TextStyle get heroTitle => GoogleFonts.orbitron(
    fontSize  : 48,
    fontWeight: FontWeight.w900,
    color     : Colors.white,
    letterSpacing: 8,
    shadows   : [
      Shadow(
        color     : AppColors.cyan,
        blurRadius: 20,
        offset    : const Offset(0, 0),
      ),
      Shadow(
        color     : AppColors.purple,
        blurRadius: 30,
        offset    : const Offset(0, 0),
      ),
    ],
  );

  // ── EXODUS logo in navbar ─────────────────────────────
  static TextStyle get navLogo => GoogleFonts.orbitron(
    fontSize  : 18,
    fontWeight: FontWeight.w800,
    color     : Colors.white,
    letterSpacing: 4,
  );

  // ── EXODUS logo in sections ───────────────────────────
  static TextStyle get sectionLogo => GoogleFonts.orbitron(
    fontSize  : 28,
    fontWeight: FontWeight.w900,
    color     : Colors.white,
    letterSpacing: 6,
  );

  // ── Section heading ───────────────────────────────────
  static TextStyle get sectionHeading => GoogleFonts.orbitron(
    fontSize  : 20,
    fontWeight: FontWeight.w700,
    color     : AppColors.textWhite,
    letterSpacing: 1,
  );

  // ── Section subheading ────────────────────────────────
  static TextStyle get sectionSubHeading => GoogleFonts.rajdhani(
    fontSize  : 18,
    fontWeight: FontWeight.w600,
    color     : AppColors.textWhite,
    letterSpacing: 0.5,
  );

  // ── Body text ─────────────────────────────────────────
  static TextStyle get bodyText => GoogleFonts.rajdhani(
    fontSize  : 14,
    fontWeight: FontWeight.w400,
    color     : AppColors.textGrey,
    height    : 1.6,
  );

  // ── Body text white ───────────────────────────────────
  static TextStyle get bodyTextWhite => GoogleFonts.rajdhani(
    fontSize  : 14,
    fontWeight: FontWeight.w400,
    color     : AppColors.textWhite,
    height    : 1.6,
  );

  // ── Body text dark (white sections) ──────────────────
  static TextStyle get bodyTextDark => GoogleFonts.rajdhani(
    fontSize  : 14,
    fontWeight: FontWeight.w400,
    color     : AppColors.comingSoonText,
    height    : 1.6,
  );

  // ── Feature box title ─────────────────────────────────
  static TextStyle get featureTitle => GoogleFonts.rajdhani(
    fontSize  : 13,
    fontWeight: FontWeight.w600,
    color     : AppColors.textWhite,
    letterSpacing: 0.3,
  );

  // ── Button text ───────────────────────────────────────
  static TextStyle get btnText => GoogleFonts.orbitron(
    fontSize  : 12,
    fontWeight: FontWeight.w700,
    color     : Colors.white,
    letterSpacing: 2,
  );

  // ── Button text small ─────────────────────────────────
  static TextStyle get btnTextSm => GoogleFonts.orbitron(
    fontSize  : 10,
    fontWeight: FontWeight.w600,
    color     : Colors.white,
    letterSpacing: 1.5,
  );

  // ── Coming soon heading ───────────────────────────────
  static TextStyle get comingSoonHeading => GoogleFonts.orbitron(
    fontSize  : 18,
    fontWeight: FontWeight.w800,
    color     : AppColors.comingSoonText,
    letterSpacing: 1,
  );

  // ── FAQ question ──────────────────────────────────────
  static TextStyle get faqQuestion => GoogleFonts.rajdhani(
    fontSize  : 14,
    fontWeight: FontWeight.w600,
    color     : AppColors.textWhite,
    letterSpacing: 0.3,
  );

  // ── FAQ answer ────────────────────────────────────────
  static TextStyle get faqAnswer => GoogleFonts.rajdhani(
    fontSize  : 13,
    fontWeight: FontWeight.w400,
    color     : AppColors.textGrey,
    height    : 1.6,
  );

  // ── Input label ───────────────────────────────────────
  static TextStyle get inputLabel => GoogleFonts.rajdhani(
    fontSize  : 13,
    fontWeight: FontWeight.w500,
    color     : AppColors.textGrey,
  );

  // ── Input text ────────────────────────────────────────
  static TextStyle get inputText => GoogleFonts.rajdhani(
    fontSize  : 14,
    fontWeight: FontWeight.w400,
    color     : AppColors.textWhite,
  );

  // ── Roadmap title ─────────────────────────────────────
  static TextStyle get roadmapTitle => GoogleFonts.orbitron(
    fontSize  : 14,
    fontWeight: FontWeight.w700,
    color     : AppColors.cyan,
    letterSpacing: 1,
  );

  // ── Roadmap body ──────────────────────────────────────
  static TextStyle get roadmapBody => GoogleFonts.rajdhani(
    fontSize  : 13,
    fontWeight: FontWeight.w400,
    color     : AppColors.textGrey,
    height    : 1.5,
  );

  // ── Footer link ───────────────────────────────────────
  static TextStyle get footerLink => GoogleFonts.rajdhani(
    fontSize  : 13,
    fontWeight: FontWeight.w500,
    color     : AppColors.textGrey,
  );

  // ── Footer copyright ──────────────────────────────────
  static TextStyle get footerCopyright => GoogleFonts.rajdhani(
    fontSize  : 11,
    fontWeight: FontWeight.w400,
    color     : AppColors.textDarkGrey,
  );

  // ── Navbar item ───────────────────────────────────────
  static TextStyle get navItem => GoogleFonts.rajdhani(
    fontSize  : 14,
    fontWeight: FontWeight.w500,
    color     : AppColors.textWhite,
  );

  // ── "COMING SOON" badge ───────────────────────────────
  static TextStyle get badge => GoogleFonts.orbitron(
    fontSize  : 10,
    fontWeight: FontWeight.w700,
    color     : Colors.white,
    letterSpacing: 2,
  );

  // ── Partners section ──────────────────────────────────
  static TextStyle get partnersTitle => GoogleFonts.orbitron(
    fontSize  : 18,
    fontWeight: FontWeight.w700,
    color     : AppColors.comingSoonText,
    letterSpacing: 1,
  );
}