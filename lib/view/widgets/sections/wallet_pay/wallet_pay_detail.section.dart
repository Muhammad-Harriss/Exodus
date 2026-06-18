import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_images.dart';

class WalletPayDetailSection extends StatelessWidget {
  const WalletPayDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // ── Header banner ──────────────────────────────
          Container(
            width  : screenWidth,
            padding: const EdgeInsets.symmetric(vertical: 18),
            color  : const Color(0x2B3853A4),
            child  : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children          : [

                Text(
                  'THE LAUNCH OF A NEW DAWN',
                  textAlign: TextAlign.center,
                  style    : GoogleFonts.montserrat(
                    fontSize     : 16.47,
                    fontWeight   : FontWeight.w700,
                    color        : Colors.white,
                    height       : 1.0,
                    letterSpacing: 0.3,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children         : [

                    Text(
                      '28th December 2022',
                      style: GoogleFonts.montserrat(
                        fontSize  : 11.57,
                        fontWeight: FontWeight.w500,
                        color     : const Color(0xFF6080DE),
                        height    : 1.0,
                      ),
                    ),

                    const SizedBox(width: 16),

                    const Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFFFF4D6D),
                      size : 14,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      '128',
                      style: GoogleFonts.montserrat(
                        fontSize  : 11.57,
                        fontWeight: FontWeight.w500,
                        color     : Colors.white70,
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          const SizedBox(height: 22),

          // ── Hero image (dawn1) ──────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child  : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child       : Image.asset(
                AppImages.dawn1,
                width : 349,
                height: 265,
                fit   : BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ── First body — split into 2-line paragraph blocks ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child  : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children          : [

                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: GoogleFonts.montserrat(
                    fontSize  : 10,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white70,
                    height    : 1.7,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: GoogleFonts.montserrat(
                    fontSize  : 10,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white70,
                    height    : 1.7,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                  style: GoogleFonts.montserrat(
                    fontSize  : 10,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white70,
                    height    : 1.7,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: GoogleFonts.montserrat(
                    fontSize  : 10,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white70,
                    height    : 1.7,
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 28),

          // ── Image only (no text overlay) ──────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child  : ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child       : Image.asset(
                AppImages.dawn2,
                width : 335,
                height: 280,
                fit   : BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ── Quote — own block BELOW image ─────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child  : Text(
              '"The next wave of the web3 is going to be user generated content"',
              style: GoogleFonts.montserrat(
                fontSize  : 22,
                fontWeight: FontWeight.w700,
                color     : const Color(0xFF6080DE),
                height    : 1.3,
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ── Final paragraph — split into 2-line blocks ─────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child  : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children          : [

                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: GoogleFonts.montserrat(
                    fontSize  : 10,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white70,
                    height    : 1.7,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: GoogleFonts.montserrat(
                    fontSize  : 10,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white70,
                    height    : 1.7,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                  style: GoogleFonts.montserrat(
                    fontSize  : 10,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white70,
                    height    : 1.7,
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 40),

        ],
      ),
    );
  }
}