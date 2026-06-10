// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_images.dart';

class MobileCryptoSection extends StatelessWidget {
  const MobileCryptoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top ≈ 800px (after hero 750 + navbar 78)
    // All positions relative to section top
    // top: 878 - 800 = 78 from section top

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Stack(
        clipBehavior: Clip.hardEdge,
        children    : [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 78),

              // ── "What is Crypto Mining?" ───────────────
              // width: 262, height: 24
              // top: 878 - 800 = 78, left: 31
              // font: Montserrat Bold 700, 20px
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child  : SizedBox(
                  width : 262,
                  height: 24,
                  child : Text(
                    'What is Crypto Mining?',
                    style: GoogleFonts.montserrat(
                      fontSize     : 20,
                      fontWeight   : FontWeight.w700,
                      color        : Colors.white,
                      height       : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ── Body text ─────────────────────────────
              // width: 322.5, height: 105.5
              // top: 927.5 - 800 = 127.5, left: 31
              // font: Montserrat Medium 500, 15.07px
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child  : SizedBox(
                  width : 322.5,
                  height: 105.5,
                  child : Text(
                    'Players mine special rocks to earn Crypto Metamoney, Exodus\'s MMORPG in-game currency. Players may use this currency to trade with other players within the game through player to player trading.',
                    style: GoogleFonts.montserrat(
                      fontSize     : 15.07,
                      fontWeight   : FontWeight.w500,
                      color        : Colors.white,
                      height       : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 11),

              // ── "Email address" label ─────────────────
              // width: 111, height: 19
              // top: 1043.5 - 800 = 243.5, left: 31
              // font: Montserrat Medium 500, 15.5px
              // color: #FCFCFC, text-decoration: underline
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child  : SizedBox(
                  width : 111,
                  height: 19,
                  child : Text(
                    'Email address',
                    style: GoogleFonts.montserrat(
                      fontSize       : 15.5,
                      fontWeight     : FontWeight.w500,
                      color          : const Color(0xFFFCFCFC),
                      height         : 1.0,
                      letterSpacing  : 0,
                      decoration     : TextDecoration.underline,
                      decorationColor: const Color(0xFFFCFCFC),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ── Email input container ─────────────────
              // width: 303, height: 36
              // top: 1072.5 - 800 = 272.5, left: 31
              // border-radius: 3.67, bg: #FFFFFF0F
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child  : Container(
                  width : 303,
                  height: 36,
                  decoration: BoxDecoration(
                    color       : const Color(0x0FFFFFFF), // #FFFFFF0F
                    borderRadius: BorderRadius.circular(3.67),
                    border      : Border.all(
                      color: const Color(0xFF2A2A4A),
                      width: 0.5,
                    ),
                  ),
                  child: TextField(
                    style    : GoogleFonts.montserrat(
                      fontSize  : 10,
                      fontWeight: FontWeight.w500,
                      color     : const Color(0x73FCFCFC),
                    ),
                    decoration: InputDecoration(
                      // hint: example@gmail.com
                      // width: 108, height: 12
                      // left offset: 49.12 - 31 = 18.12 from container left
                      hintText      : 'example@gmail.com',
                      hintStyle     : GoogleFonts.montserrat(
                        fontSize  : 10,
                        fontWeight: FontWeight.w500,
                        color     : const Color(0x73FCFCFC), // #FCFCFC73
                      ),
                      border        : InputBorder.none,
                      enabledBorder : InputBorder.none,
                      focusedBorder : InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left  : 18,  // 49.12 - 31 = 18.12
                        bottom: 8,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 9),

              // ── Checkbox + agree text row ─────────────
              // checkbox: width: 10, height: 10.5
              //           top: 1117.5 - 800 = 317.5, left: 31
              //           border-radius: 1, border: 0.5 solid #777777
              // text: width: 262, height: 11
              //       top: 1117 - 800 = 317, left: 44.5
              //       font: Montserrat Medium 500, 9px
              //       color: #FCFCFC73
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child  : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children          : [

                    // Checkbox
                    Container(
                      width : 10,
                      height: 10.5,
                      decoration: BoxDecoration(
                        color       : Colors.transparent,
                        borderRadius: BorderRadius.circular(1),
                        border      : Border.all(
                          color: const Color(0xFF777777),
                          width: 0.5,
                        ),
                      ),
                    ),

                    const SizedBox(width: 3.5), // 44.5 - 31 - 10 = 3.5

                    // Agree text
                    SizedBox(
                      width : 262,
                      height: 11,
                      child : Text(
                        'I agree to recieving marketing and promotional materials',
                        style: GoogleFonts.montserrat(
                          fontSize  : 9,
                          fontWeight: FontWeight.w500,
                          color     : const Color(0x73FCFCFC), // #FCFCFC73
                          height    : 1.0,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── Join waitlist button ──────────────────
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child  : _JoinWaitlistButton(),
              ),

              const SizedBox(height: 24),

              // ── Hero mining image ─────────────────────
              // width: 336.58, height: 358
              // top: 1132 - 800 = 332, left: -8
              SizedBox(
                width : screenWidth,
                height: 358,
                child : Stack(
                  children: [
                    Positioned(
                      top : 0,
                      left: -8,
                      child: Image.asset(
                        AppImages.heroMining,
                        width : 336.58,
                        height: 358,
                        fit   : BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

// ── Join Waitlist Button ────────────────────────────────
class _JoinWaitlistButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width : 120,
      height: 40,
      decoration: BoxDecoration(
        color       : const Color(0xFF3853A4),
        borderRadius: BorderRadius.circular(6),
        boxShadow   : [
          BoxShadow(
            color     : const Color(0xFF3853A4).withOpacity(0.4),
            blurRadius: 10,
            offset    : const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Join waitlist',
          style: GoogleFonts.montserrat(
            fontSize     : 13,
            fontWeight   : FontWeight.w600,
            color        : Colors.white,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}