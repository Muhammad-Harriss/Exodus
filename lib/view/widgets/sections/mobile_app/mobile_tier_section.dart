import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_images.dart';

class MobileTierSection extends StatelessWidget {
  const MobileTierSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: const Color(0xFF080818),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 22),

          // ── Row 1: Tier 4, Tier 3, Tier 2 ──
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TierCard(
                imageName: AppImages.tier4,
                coins: '20x coins',
                price: '\$14.99/M',
                description: '20x Coin Earnings\n100,000 Rock Impact',
              ),
              const SizedBox(width: 8),
              _TierCard(
                imageName: AppImages.tier3,
                coins: '15x coins',
                price: '\$12.49/M',
                description: '15x Coin Earnings\n75,000 Rock Impact',
              ),
              const SizedBox(width: 8),
              _TierCard(
                imageName: AppImages.tier2,
                coins: '6x coins',
                price: '\$4.99/M',
                description: '6x Coin Earnings\n30,000 Rock Impact',
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── Row 2: Tier 1, Tier 0 (Perfect Alignment Sync) ──
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TierCard(
                imageName: AppImages.tier1,
                coins: '2x coins',
                price: '\$1.99/M',
                description: '2x Coin Earnings\n10,000 Rock Impact',
              ),
              const SizedBox(width: 8),
              _TierCard(
                imageName: AppImages.tier0,
                coins: '1x coins',
                price: 'FREE',
                description: '1x Coin Earnings\n5,000 Rock Impact',
                isFree: true,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ── Cloak Card ──
          _CloakCard(),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ── Tier Card Widget Component ───────────────────────────
class _TierCard extends StatelessWidget {
  final String imageName;
  final String coins;
  final String price;
  final String description;
  final bool isFree;

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
      width: 104,
      height: 155, 
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F1E),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xCC575C5F),
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          // 1. Unified Fixed Image Frame with Absolute Centering
          SizedBox(
            height: 52, 
            width: 52,  
            child: Center(
              child: Image.asset(
                imageName,
                fit: BoxFit.contain, // Prevents distortion/clipping seen in fill modes
              ),
            ),
          ),
          
          const SizedBox(height: 8),

          // 2. Coins Label Fixed Height Row
          SizedBox(
            height: 14,
            child: Center(
              child: Text(
                coins.toLowerCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 2),

          // 3. Price Label Fixed Height Row
          SizedBox(
            height: 12,
            child: Center(
              child: Text(
                price,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 8.5,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF58CB11),
                  height: 1.0,
                ),
              ),
            ),
          ),

          const SizedBox(height: 6),

          // 4. Description Field
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 6.8,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFADADAD),
                  height: 1.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Cloak Card Widget Component ──────────────────────────
class _CloakCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 178,
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F1E),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xCC575C5F),
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.cloak,
            width: 52,
            height: 52,
            fit: BoxFit.contain,
          ),
          
          SizedBox(
            width: 240,
            child: Text(
              'Players who hold the NFT Lifetime Cloak will have Tier 4 Crypto Mining & Membership Thing at no extra cost. Learn more about our lifetime limited membership.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 8.5,
                fontWeight: FontWeight.w500,
                color: const Color(0xCCC8C8C8),
                height: 1.4,
              ),
            ),
          ),

          Container(
            width: 120,
            height: 26,
            decoration: BoxDecoration(
              color: const Color(0xFF3853A4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                'Lifetime Membership',
                style: GoogleFonts.montserrat(
                  fontSize: 7.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}