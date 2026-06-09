// ignore_for_file: deprecated_member_use

import 'package:exous/core/constants/app_images.dart';
import 'package:flutter/material.dart';


class FeatureBoxesSection extends StatelessWidget {
  const FeatureBoxesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width : screenWidth,
      color : const Color(0xFF0D1117),
      child : Stack(
        children: [

          // ── Content column ───────────────────────────
          Column(
            children: [

              const SizedBox(height: 16),

              // ── 4 feature boxes (2x2 grid) ───────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child  : Column(
                  children: [

                    // Row 1
                    Row(
                      children: [
                        Expanded(
                          child: _FeatureBox(
                            text: 'Earn Metamoney\nWhile Mining',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _FeatureBox(
                            text: 'Use Metamoney to\nTrade in Game',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Row 2
                    Row(
                      children: [
                        Expanded(
                          child: _FeatureBox(
                            text: 'Available on ios\ndevices',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _FeatureBox(
                            text: 'Upgrade tier to\nmine faster',
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Phone image ───────────────────────────
              // width: 209, height: 341
              // top: 1003px from page top
              // top from this section = 1003 - 78(nav) - 656(hero) = 269
              // left: 85px → centered with left: 85
              SizedBox(
                width : screenWidth,
                height: 341,
                child : Stack(
                  children: [
                    Positioned(
                      left: 85,
                      top : 0,
                      child: Image.asset(
                        AppImages.heroPhone,
                        width : 209,
                        height: 341,
                        fit   : BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── COMING SOON button ────────────────────
              // width: 222, height: 39.21
              // left: 77px
              Container(
                width : 222,
                height: 39.21,
                decoration: BoxDecoration(
                  color       : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border      : Border.all(
                    color: const Color(0xFF444466),
                    width: 1.5,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'COMING SOON',
                    style: TextStyle(
                      fontSize     : 13,
                      fontWeight   : FontWeight.w700,
                      color        : Colors.white,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

            ],
          ),

        ],
      ),
    );
  }
}

// ── Feature Box Widget ──────────────────────────────────
class _FeatureBox extends StatelessWidget {
  final String text;

  const _FeatureBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height    : 54,
      decoration: BoxDecoration(
        color       : const Color(0xFF111827),
        borderRadius: BorderRadius.circular(8),
        border      : Border.all(
          color: const Color(0xFF2A3A5A),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color     : const Color(0xFF0044AA).withOpacity(0.15),
            blurRadius: 8,
            offset    : const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style    : const TextStyle(
            fontSize  : 11.5,
            fontWeight: FontWeight.w600,
            color     : Colors.white,
            height    : 1.4,
          ),
        ),
      ),
    );
  }
}