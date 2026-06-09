import 'package:exous/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class PartnersFooterSection extends StatelessWidget {
  const PartnersFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top ≈ 4370px
    // All positions relative to section top
    // top: 4400 - 4370 = 30 from section top

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Stack(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 30),

              // ── "Our partners" heading ─────────────────
              // width: 167, height: 30
              // left: 102.6, font: Montserrat ExtraBold 800, 24.43px
              // color: #FFFFFF
              Padding(
                padding: const EdgeInsets.only(left: 102.6),
                child  : SizedBox(
                  width : 167,
                  height: 30,
                  child : Text(
                    'Our partners',
                    style: GoogleFonts.montserrat(
                      fontSize  : 24.43,
                      fontWeight: FontWeight.w800,
                      color     : const Color(0xFFFFFFFF),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ── Partner logos row ─────────────────────
              // orangeCircle: width:57.54, height:57.54, left:76
              // partnerWaifumon: width:116.16, height:55.39, left:181.84
              SizedBox(
                width : screenWidth,
                height: 60,
                child : Stack(
                  children: [

                    // Orange circle partner logo
                    Positioned(
                      left: 76,
                      top : 0,
                      child: Image.asset(
                        AppImages.orangeCircle,
                        width : 57.54,
                        height: 57.54,
                        fit   : BoxFit.contain,
                      ),
                    ),

                    // Waifumon partner logo
                    Positioned(
                      left: 181.84,
                      top : 2.43,  // 4461.87 - 4459.44 = 2.43 offset
                      child: Image.asset(
                        AppImages.partnerWaifumon,
                        width : 116.16,
                        height: 55.39,
                        fit   : BoxFit.contain,
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 60),

              // ── Exodus logo text ──────────────────────
              // width: 165.08, height: 35.29
              // left: 18
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child  : Image.asset(
                  AppImages.exodusLogoText,
                  width : 165.08,
                  height: 35.29,
                  fit   : BoxFit.contain,
                ),
              ),

              const SizedBox(height: 14),

              // ── Exodus description ────────────────────
              // width: 302.24, height: 70.59
              // left: 32, font: Montserrat Medium 500, 12.83px
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child  : SizedBox(
                  width : 302.24,
                  height: 70.59,
                  child : Text(
                    'Exodus is a Metaverse Role-Playing Game\n(M.R.P.G) built in Decentraland that\nbrings a new adventure to gaming',
                    style: GoogleFonts.montserrat(
                      fontSize  : 12.83,
                      fontWeight: FontWeight.w500,
                      color     : Colors.white,
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // ── "Game" heading ────────────────────────
              // width: 81.58, height: 30.46
              // left: 32, font: Montserrat Bold 700, 20px
              // color: #3853A4
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child  : SizedBox(
                  width : 81.58,
                  height: 30.46,
                  child : Text(
                    'Game',
                    style: GoogleFonts.montserrat(
                      fontSize  : 20,
                      fontWeight: FontWeight.w700,
                      color     : const Color(0xFF3853A4),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // ── "How to play exodus" link ─────────────
              // width: 173.37, height: 22.65
              // left: 32, font: Montserrat Medium 500, 15.62px
              // text-decoration: underline
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child  : SizedBox(
                  width : 173.37,
                  height: 22.65,
                  child : Text(
                    'How to play exodus',
                    style: GoogleFonts.montserrat(
                      fontSize        : 15.62,
                      fontWeight      : FontWeight.w500,
                      color           : Colors.white,
                      height          : 1.0,
                      letterSpacing   : 0,
                      decoration      : TextDecoration.underline,
                      decorationColor : Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // ── "Communities" heading ─────────────────
              // width: 141.25, height: 24.38
              // left: 32, font: Montserrat Bold 700, 20px
              // color: #3853A4
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child  : SizedBox(
                  width : 141.25,
                  height: 24.38,
                  child : Text(
                    'Communities',
                    style: GoogleFonts.montserrat(
                      fontSize  : 20,
                      fontWeight: FontWeight.w700,
                      color     : const Color(0xFF3853A4),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── Social icons row ──────────────────────
              // width: 105, height: 18.16
              // left: 32
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child  : SizedBox(
                  width : 105,
                  height: 18.16,
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children         : [

                      // Facebook
                      SvgPicture.asset(
                        AppImages.iconfacebook,
                        width : 18.16,
                        height: 18.16,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),

                      // Twitter
                      SvgPicture.asset(
                        AppImages.iconTwitter,
                        width : 18.16,
                        height: 18.16,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),

                      // Youtube
                      SvgPicture.asset(
                        AppImages.iconYoutube,
                        width : 18.16,
                        height: 18.16,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),

                      // Instagram
                      SvgPicture.asset(
                        AppImages.iconInstagram,
                        width : 18.16,
                        height: 18.16,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),

                      // Mail
                      SvgPicture.asset(
                        AppImages.iconMail,
                        width : 18.16,
                        height: 18.16,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── "Copyrighted 2024" ────────────────────
              // width: 118, height: 22
              // left: 32, font: Montserrat Medium 500, 12.83px
              // color: #FCFCFC
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child  : SizedBox(
                  width : 118,
                  height: 22,
                  child : Text(
                    'Copyrighted 2024',
                    style: GoogleFonts.montserrat(
                      fontSize  : 12.83,
                      fontWeight: FontWeight.w500,
                      color     : const Color(0xFFFCFCFC),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

            ],
          ),

        ],
      ),
    );
  }
}