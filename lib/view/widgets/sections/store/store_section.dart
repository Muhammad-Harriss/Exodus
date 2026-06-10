import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_images.dart';

class StoreSection extends StatelessWidget {
  const StoreSection({super.key});

  @override
  Widget build(BuildContext context) {

    // ── Screen: 375 x 791 ────────────────────────────
    // Navbar height: 78
    // Available content width: 375

    return Container(
      width : 375,
      color : const Color(0xFF080818),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 28),

          // ── "UPGRADE TIER" heading ────────────────────
          // width: 188, height: 29
          // top: 105.71 - 78 = 27.71 → 28
          // left: 99.83
          // font: Montserrat SemiBold 600, 23.86px
          // color: #FFFFFF
          const Padding(
            padding: EdgeInsets.only(left: 99.83),
            child  : SizedBox(
              width : 188,
              height: 29,
              child : _UpgradeTierHeading(),
            ),
          ),

          const SizedBox(height: 39),

          // ── Tiers dropdown ────────────────────────────
          // width: 168, height: 40
          // top: 172.03 - 78 = 94.03
          // left: 103
          const Padding(
            padding: EdgeInsets.only(left: 103),
            child  : _TiersDropdown(),
          ),

          const SizedBox(height: 23),

          // ── Row 1: Tier 4 + Tier 3 ───────────────────
          // Screen width: 375
          // Card width: 160.31
          // Left card: left: 21
          // Right card: left: 195.5 (21 + 160.31 + 14.19 gap)
          // Total: 21 + 160.31 + 14.19 + 160.31 + 18.19 = 374 ✅
          SizedBox(
            width : 375,
            height: 214.11,
            child : Stack(
              children: [

                // Tier 4 — left: 21
                const Positioned(
                  left: 21,
                  top : 0,
                  child: _StoreCard(imageName: AppImages.tier4),
                ),

                // Tier 3 — left: 195.5
                const Positioned(
                  left: 195.5,
                  top : 0,
                  child: _StoreCard(imageName: AppImages.tier3),
                ),

              ],
            ),
          ),

          const SizedBox(height: 12),

          // ── Row 2: Tier 2 + Tier 1 ───────────────────
          // top: 461.76 - 78 = 383.76
          // Card 1 left: 22.34
          // Card 2 left: 196.53 (22.34 + 160.31 + 13.88 gap)
          SizedBox(
            width : 375,
            height: 214.11,
            child : Stack(
              children: [

                // Tier 2 — left: 22.34
                const Positioned(
                  left: 22.34,
                  top : 0,
                  child: _StoreCard(imageName: AppImages.tier2),
                ),

                // Tier 1 — left: 192.65
                const Positioned(
                  left: 192.65,
                  top : 0,
                  child: _StoreCard(imageName: AppImages.tier1),
                ),

              ],
            ),
          ),

          const SizedBox(height: 32),

        ],
      ),
    );
  }
}

// ── Upgrade Tier Heading ────────────────────────────────
class _UpgradeTierHeading extends StatelessWidget {
  const _UpgradeTierHeading();

  @override
  Widget build(BuildContext context) {
    return Text(
      'UPGRADE TIER',
      style: GoogleFonts.montserrat(
        fontSize     : 23.86,
        fontWeight   : FontWeight.w600,
        color        : const Color(0xFFFFFFFF),
        height       : 1.0,
        letterSpacing: 0,
      ),
    );
  }
}

// ── Tiers Dropdown ──────────────────────────────────────
class _TiersDropdown extends StatelessWidget {
  const _TiersDropdown();

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 168, height: 40
      // left: 103
      width : 168,
      height: 40,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin : Alignment.centerLeft,
          end   : Alignment.centerRight,
          colors: [
            Color(0xFF3853A4),
            Color(0xFF3853A4),
          ],
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children         : [

          // "Tiers" text
          // width: 40, height: 20
          // font: Montserrat Medium 500, 16.52px
          // color: #FFFFFF
          Text(
            'Tiers',
            style: GoogleFonts.montserrat(
              fontSize  : 16.52,
              fontWeight: FontWeight.w500,
              color     : const Color(0xFFFFFFFF),
              height    : 1.0,
            ),
          ),

          const SizedBox(width: 8),

          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
            size : 20,
          ),

        ],
      ),
    );
  }
}

// ── Store Card ──────────────────────────────────────────
class _StoreCard extends StatelessWidget {
  final String imageName;

  const _StoreCard({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 160.31, height: 214.11
      // border-radius: 3.49
      // border: 0.5px solid #575C5FCC
      width : 160.31,
      height: 214.11,
      decoration: BoxDecoration(
        color       : const Color(0xFF0F0F1E),
        borderRadius: BorderRadius.circular(3.49),
        border      : Border.all(
          color: const Color(0xCC575C5F),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children         : [

          const SizedBox(height: 9),

          // ── Tier image ──────────────────────────────
          // width: 74.70, height: 74.70
          // top: 243.89 - 235 = 8.89 from card top
          Image.asset(
            imageName,
            width : 74.70,
            height: 74.70,
            fit   : BoxFit.contain,
          ),

          const SizedBox(height: 7),

          // ── Title ───────────────────────────────────
          // width: 79, height: 13
          // font: Montserrat SemiBold 600, 10.46px
          // left: 62.33 - 21(card left) = 41.33 from card left
          Text(
            'Tier 4 upgrade',
            textAlign: TextAlign.center,
            style    : GoogleFonts.montserrat(
              fontSize  : 10.46,
              fontWeight: FontWeight.w600,
              color     : Colors.white,
              height    : 1.0,
            ),
          ),

          const SizedBox(height: 4),

          // ── Description ─────────────────────────────
          // width: 121, height: 30
          // font: Poppins Regular 400, 6.97px
          // left: 41.42 - 21 = 20.42 from card left
          SizedBox(
            width: 121,
            child: Text(
              'Tier 4 upgrade gives features to all\nupgrade service as well as an\nall exclusive battle pass',
              textAlign: TextAlign.center,
              style    : GoogleFonts.poppins(
                fontSize  : 6.97,
                fontWeight: FontWeight.w400,
                color     : Colors.white70,
                height    : 1.0,
              ),
            ),
          ),

          const SizedBox(height: 11),

          // ── Price row ───────────────────────────────
          // $95: left:79.45 - 21 = 58.45 from card left
          //      font: 9.9px SemiBold, #58CB11
          // $150: left:104.21 - 21 = 83.21 from card left
          //       font: 9.9px Medium, strikethrough, white54
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children         : [

              Text(
                '\$95',
                style: GoogleFonts.montserrat(
                  fontSize  : 9.9,
                  fontWeight: FontWeight.w600,
                  color     : const Color(0xFF58CB11),
                  height    : 1.0,
                ),
              ),

              const SizedBox(width: 6),

              Text(
                '\$150',
                style: GoogleFonts.montserrat(
                  fontSize       : 9.9,
                  fontWeight     : FontWeight.w500,
                  color          : Colors.white54,
                  height         : 1.0,
                  decoration     : TextDecoration.lineThrough,
                  decorationColor: Colors.white54,
                ),
              ),

            ],
          ),

          const SizedBox(height: 10),

          // ── Button row ───────────────────────────────
          // Buy now:
          //   width: 57.27, height: 19.42
          //   left: 43.91 - 21 = 22.91 from card left
          //   border-radius: 3.56
          //   bg: #3853A4
          //   font: Montserrat SemiBold 600, 6.17px, #FFFFFF
          // Add to cart:
          //   width: 57.27, height: 19.42
          //   left: 106.2 - 21 = 85.2 from card left
          //   border: 0.5px #4463BF
          //   font: Montserrat SemiBold 600, 6.17px, #4463BF
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children         : [

              // Buy now
              Container(
                width : 57.27,
                height: 19.42,
                decoration: BoxDecoration(
                  color       : const Color(0xFF3853A4),
                  borderRadius: BorderRadius.circular(3.56),
                ),
                child: Center(
                  child: Text(
                    'Buy now',
                    style: GoogleFonts.montserrat(
                      fontSize  : 6.17,
                      fontWeight: FontWeight.w600,
                      color     : Colors.white,
                      height    : 1.0,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 5),

              // Add to cart
              Container(
                width : 57.27,
                height: 19.42,
                decoration: BoxDecoration(
                  color       : Colors.transparent,
                  borderRadius: BorderRadius.circular(3.56),
                  border      : Border.all(
                    color: const Color(0xFF4463BF),
                    width: 0.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Add to cart',
                    style: GoogleFonts.montserrat(
                      fontSize  : 6.17,
                      fontWeight: FontWeight.w600,
                      color     : const Color(0xFF4463BF),
                      height    : 1.0,
                    ),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}