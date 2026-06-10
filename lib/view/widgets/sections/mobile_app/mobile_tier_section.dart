import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_images.dart';

class MobileTierSection extends StatelessWidget {
  const MobileTierSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top ≈ 1910px
    // All positions relative to section top
    // top: 1932 - 1910 = 22 from section top

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Column(
        children: [

          const SizedBox(height: 22),

          // ── Row 1: Tier 4, Tier 3, Tier 2 ────────────
          // All cards: top:1932, heights:131.09
          // left: 25, 135.78, 246.13
          SizedBox(
            width : screenWidth,
            height: 131.09,
            child : Stack(
              children: [

                // Tier 4 card — left: 25
                Positioned(
                  left: 25,
                  top : 0,
                  child: _TierCard(
                    imageName  : AppImages.tier4,
                    coins      : '20x coins',
                    price      : '\$14.99/M',
                    description: '20x Coin Earnings\n100,000 Rock Impact',
                  ),
                ),

                // Tier 3 card — left: 135.78
                Positioned(
                  left: 135.78,
                  top : 0,
                  child: _TierCard(
                    imageName  : AppImages.tier3,
                    coins      : '15x coins',
                    price      : '\$12.49/M',
                    description: '15x Coin Earnings\n75,000 Rock Impact',
                  ),
                ),

                // Tier 2 card — left: 246.13
                Positioned(
                  left: 246.13,
                  top : 0,
                  child: _TierCard(
                    imageName  : AppImages.tier2,
                    coins      : '6x coins',
                    price      : '\$4.99/M',
                    description: '6x Coin Earnings\n30,000 Rock Impact',
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── Row 2: Tier 1, Tier 0 ─────────────────────
          // top: 2071.04, heights: 131.05
          // left: 88, 198.31
          SizedBox(
            width : screenWidth,
            height: 131.05,
            child : Stack(
              children: [

                // Tier 1 card — left: 88
                Positioned(
                  left: 88,
                  top : 0,
                  child: _TierCard(
                    imageName  : AppImages.tier1,
                    coins      : '2x coins',
                    price      : '\$1.99/M',
                    description: '2x Coin Earnings\n10,000 Rock Impact',
                  ),
                ),

                // Tier 0 card — left: 198.31
                Positioned(
                  left: 198.31,
                  top : 0,
                  child: _TierCard(
                    imageName  : AppImages.tier0,
                    coins      : '1X COINS',
                    price      : 'FREE',
                    description: '1x Coin Earnings\n5,000 Rock Impact',
                    isFree     : true,
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Cloak card ────────────────────────────────
          // width: 316, height: 178
          // top: 2210.04 - 1910 = 300.04, left: 34
          SizedBox(
            width : screenWidth,
            height: 178,
            child : Stack(
              children: [
                Positioned(
                  left: 34,
                  top : 0,
                  child: _CloakCard(),
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

// ── Tier Card ───────────────────────────────────────────
class _TierCard extends StatelessWidget {
  final String imageName;
  final String coins;
  final String price;
  final String description;
  final bool   isFree;

  const _TierCard({
    required this.imageName,
    required this.coins,
    required this.price,
    required this.description,
    this.isFree = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 103.72, height: 131.09
      width : 103.72,
      height: 131.09,
      decoration: BoxDecoration(
        color       : const Color(0xFF0F0F1E),
        borderRadius: BorderRadius.circular(2.34),
        border      : Border.all(
          color: const Color(0xCC575C5F), // #575C5FCC
          width: 0.33,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children         : [

          const SizedBox(height: 9),

          // ── Tier image ──────────────────────────────
          // width: 50.24, height: 50.24
          // top: 1941 - 1932 = 9 from card top
          // left: 52.37 - 25(card left) = 27.37 from card left
          Image.asset(
            imageName,
            width : 50.24,
            height: 50.24,
            fit   : BoxFit.contain,
          ),

          const SizedBox(height: 7),

          // ── Coins text ──────────────────────────────
          // width: 55.17, height: 13
          // font: Montserrat Bold 700, 11.03px
          Text(
            coins,
            textAlign: TextAlign.center,
            style    : GoogleFonts.montserrat(
              fontSize  : 11.03,
              fontWeight: FontWeight.w700,
              color     : Colors.white,
              height    : 1.0,
            ),
          ),

          const SizedBox(height: 4),

          // ── Price text ──────────────────────────────
          // width: 37.52, height: 10
          // font: Montserrat Medium 500, 8.39px
          // color: #58CB11 (green) or white for FREE
          Text(
            price,
            textAlign: TextAlign.center,
            style    : GoogleFonts.montserrat(
              fontSize  : 8.39,
              fontWeight: FontWeight.w500,
              color     : isFree
                  ? const Color(0xFF58CB11)
                  : const Color(0xFF58CB11),
              height    : 1.0,
            ),
          ),

          const SizedBox(height: 6),

          // ── Description ─────────────────────────────
          // width: 83.42, height: 16
          // font: Montserrat Medium 500, 6.62px
          // color: #ADADAD, text-align: center
          SizedBox(
            width: 83.42,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style    : GoogleFonts.montserrat(
                fontSize  : 6.62,
                fontWeight: FontWeight.w500,
                color     : const Color(0xFFADADAD),
                height    : 1.0,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// ── Cloak Card ──────────────────────────────────────────
class _CloakCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 316, height: 178
      width : 316,
      height: 178,
      decoration: BoxDecoration(
        color       : const Color(0xFF0F0F1E),
        borderRadius: BorderRadius.circular(2.34),
        border      : Border.all(
          color: const Color(0xCC575C5F),
          width: 0.33,
        ),
      ),
      child: Stack(
        children: [

          // ── Cloak image ───────────────────────────────
          // width: 54.69, height: 54.69
          // top: 2222.68 - 2210.04 = 12.64 from card top
          // left: 163.12 - 34(card left) = 129.12 from card left
          Positioned(
            top : 12.64,
            left: 129.12,
            child: Image.asset(
              AppImages.cloak,
              width : 54.69,
              height: 54.69,
              fit   : BoxFit.contain,
            ),
          ),

          // ── Description text ──────────────────────────
          // width: 186.08, height: 54
          // top: 2286.6 - 2210.04 = 76.56, left: 95.67 - 34 = 61.67
          // font: Montserrat Medium 500, 8.17px
          // line-height: 141%, color: #C8C8C8CC
          Positioned(
            top : 76.56,
            left: 61.67,
            child: SizedBox(
              width : 186.08,
              height: 54,
              child : Text(
                'Players who hold the NFT Lifetime Cloak will have Tier 4 Crypto Mining & Membership Thing at no extra cost. Learn more about our lifetime limited membership.',
                textAlign: TextAlign.center,
                style    : GoogleFonts.montserrat(
                  fontSize  : 8.17,
                  fontWeight: FontWeight.w500,
                  color     : const Color(0xCCC8C8C8),
                  height    : 1.41,
                ),
              ),
            ),
          ),

          // ── Lifetime Membership button ────────────────
          // width: 102.65, height: 22.52
          // top: 2350.43 - 2210.04 = 140.39, left: 137.72 - 34 = 103.72
          // border-radius: 5.79, color: #3853A4
          Positioned(
            top : 140.39,
            left: 103.72,
            child: Container(
              width : 102.65,
              height: 22.52,
              decoration: BoxDecoration(
                color       : const Color(0xFF3853A4),
                borderRadius: BorderRadius.circular(5.79),
              ),
              child: Center(
                child: Text(
                  'Lifetime Membership',
                  style: GoogleFonts.montserrat(
                    // width: 76.18, height: 8.73
                    // font: Montserrat SemiBold 600, 6.74px
                    // color: #FFFFFF
                    fontSize  : 6.74,
                    fontWeight: FontWeight.w600,
                    color     : const Color(0xFFFFFFFF),
                    height    : 1.0,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}