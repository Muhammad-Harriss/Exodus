import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsletterSection extends StatelessWidget {
  const NewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top ≈ 3750px
    // All positions relative to section top
    // top: 3775 - 3750 = 25 from section top

    return Container(
      width  : screenWidth,
      color  : const Color(0xFF080818),
      padding: const EdgeInsets.only(bottom: 40),
      child  : Stack(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 25),

              // ── "Stay tuned for news and updates" ──────
              // width: 272, height: 19
              // left: 60, font: Montserrat SemiBold 600, 15.71px
              // color: #4666C7
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child  : SizedBox(
                  width : 272,
                  height: 19,
                  child : Text(
                    'Stay tuned for news and updates',
                    style: GoogleFonts.montserrat(
                      fontSize  : 15.71,
                      fontWeight: FontWeight.w600,
                      color     : const Color(0xFF4666C7),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ── First name label ──────────────────────
              // width: 98, height: 19
              // left: 47, font: Montserrat Medium 500, 15.71px
              // color: #FCFCFC
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child  : SizedBox(
                  width : 98,
                  height: 19,
                  child : Text(
                    'First name',
                    style: GoogleFonts.montserrat(
                      fontSize  : 15.71,
                      fontWeight: FontWeight.w500,
                      color     : const Color(0xFFFCFCFC),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // ── First name input ──────────────────────
              // width: 287, height: 41
              // left: 47, border-radius: 3.38
              // color: #FFFFFF0F
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child  : _InputField(
                  hint  : 'John',
                  width : 287,
                  height: 41,
                ),
              ),

              const SizedBox(height: 16),

              // ── Last name label ───────────────────────
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child  : SizedBox(
                  width : 98,
                  height: 19,
                  child : Text(
                    'Last name',
                    style: GoogleFonts.montserrat(
                      fontSize  : 15.71,
                      fontWeight: FontWeight.w500,
                      color     : const Color(0xFFFCFCFC),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // ── Last name input ───────────────────────
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child  : _InputField(
                  hint  : 'Simon',
                  width : 287,
                  height: 41,
                ),
              ),

              const SizedBox(height: 16),

              // ── Email address label ───────────────────
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child  : SizedBox(
                  width : 130,
                  height: 19,
                  child : Text(
                    'Email address',
                    style: GoogleFonts.montserrat(
                      fontSize  : 15.71,
                      fontWeight: FontWeight.w500,
                      color     : const Color(0xFFFCFCFC),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // ── Email input ───────────────────────────
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child  : _InputField(
                  hint  : 'example@gmail.com',
                  width : 287,
                  height: 41,
                ),
              ),

              const SizedBox(height: 16),

              // ── Type message here label ───────────────
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child  : SizedBox(
                  height: 19,
                  child : Text(
                    'Type message here',
                    style: GoogleFonts.montserrat(
                      fontSize  : 15.71,
                      fontWeight: FontWeight.w500,
                      color     : const Color(0xFFFCFCFC),
                      height    : 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // ── Message textarea ──────────────────────
              // width: 291, height: 133
              // left: 47, border-radius: 3.38
              // color: #FFFFFF0F
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child  : Container(
                  width : 291,
                  height: 133,
                  decoration: BoxDecoration(
                    color       : const Color(0x0FFFFFFF),
                    borderRadius: BorderRadius.circular(3.38),
                    border      : Border.all(
                      color: const Color(0xFF2A2A4A),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    maxLines  : null,
                    expands   : true,
                    style     : GoogleFonts.montserrat(
                      fontSize  : 13,
                      fontWeight: FontWeight.w400,
                      color     : Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText      : 'Type here',
                      hintStyle     : GoogleFonts.montserrat(
                        fontSize  : 13,
                        fontWeight: FontWeight.w400,
                        color     : const Color(0xFF555570),
                      ),
                      border        : InputBorder.none,
                      enabledBorder : InputBorder.none,
                      focusedBorder : InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical  : 12,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Send message button ───────────────────
              // width: 113, height: 36
              // left: 48, border-radius: 7.02
              // color: #3853A4
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child  : Container(
                  width : 113,
                  height: 36,
                  decoration: BoxDecoration(
                    color       : const Color(0xFF3853A4),
                    borderRadius: BorderRadius.circular(7.02),
                  ),
                  child: Center(
                    child: Text(
                      'Send message',
                      style: GoogleFonts.montserrat(
                        fontSize  : 12,
                        fontWeight: FontWeight.w600,
                        color     : Colors.white,
                      ),
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

// ── Reusable input field ────────────────────────────────
class _InputField extends StatelessWidget {
  final String hint;
  final double width;
  final double height;

  const _InputField({
    required this.hint,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width : width,
      height: height,
      decoration: BoxDecoration(
        color       : const Color(0x0FFFFFFF),  // #FFFFFF0F
        borderRadius: BorderRadius.circular(3.38),
        border      : Border.all(
          color: const Color(0xFF2A2A4A),
          width: 1,
        ),
      ),
      child: TextField(
        style    : GoogleFonts.montserrat(
          fontSize  : 13,
          fontWeight: FontWeight.w400,
          color     : Colors.white,
        ),
        decoration: InputDecoration(
          hintText      : hint,
          hintStyle     : GoogleFonts.montserrat(
            fontSize  : 13,
            fontWeight: FontWeight.w400,
            color     : const Color(0xFF555570),
          ),
          border        : InputBorder.none,
          enabledBorder : InputBorder.none,
          focusedBorder : InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical  : 12,
          ),
        ),
      ),
    );
  }
}