import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ── Section starts at page top ≈ 3280px
    // "Frequently asked questions" heading is above FAQ items

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── "Frequently asked questions" heading ──────
          Container(
            width  : double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical  : 20,
              horizontal: 20,
            ),
            color: const Color(0xFF0F0F1E),
            child: Center(
              child: Text(
                'Frequently asked questions',
                textAlign: TextAlign.center,
                style    : GoogleFonts.montserrat(
                  fontSize  : 16,
                  fontWeight: FontWeight.w700,
                  color     : Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // ── FAQ items ────────────────────────────────
          // First item is expanded (showing answer)
          _FaqItem(
            question  : 'What is Exodus Crypto Mining?',
            answer    : 'Exodus Crypto Mining allows users to earn Metamoney '
                        'cryptocurrency through mining special rocks in Exodus. '
                        'This update will be released for early access on April '
                        '20th, 2024. The initial release will be on mobile and will '
                        'later be released in Decentraland.',
            isExpanded: true,
            // question layout: width:180, left:32.1, font:11.24px Medium
            // answer layout:   width:317.64, left:28.21, font:11px Medium, lh:145%
            questionWidth: 180,
            questionLeft : 32.1,
            answerWidth  : 317.64,
            answerLeft   : 28.21,
          ),

          // ── Remaining FAQ items (collapsed) ──────────
          // Each item layout: width:94, font:11.24px Medium
          // top spacing between items from Figma
          _FaqItem(
            question     : 'How to Get Started?',
            answer       : 'Information about how to get started with Exodus.',
            isExpanded   : false,
            questionWidth: 94,
            questionLeft : 32.1,
            answerWidth  : 317.64,
            answerLeft   : 28.21,
          ),

          _FaqItem(
            question     : 'Device Requirements',
            answer       : 'Information about device requirements for Exodus.',
            isExpanded   : false,
            questionWidth: 94,
            questionLeft : 32.1,
            answerWidth  : 317.64,
            answerLeft   : 28.21,
          ),

          _FaqItem(
            question     : 'Mining Limits',
            answer       : 'Information about mining limits in Exodus.',
            isExpanded   : false,
            questionWidth: 94,
            questionLeft : 32.1,
            answerWidth  : 317.64,
            answerLeft   : 28.21,
          ),

          _FaqItem(
            question     : 'Using Metamoney',
            answer       : 'Information about how to use Metamoney in Exodus.',
            isExpanded   : false,
            questionWidth: 94,
            questionLeft : 32.1,
            answerWidth  : 317.64,
            answerLeft   : 28.21,
          ),

          _FaqItem(
            question     : 'Conversion Fees',
            answer       : 'Information about conversion fees in Exodus.',
            isExpanded   : false,
            questionWidth: 94,
            questionLeft : 32.1,
            answerWidth  : 317.64,
            answerLeft   : 28.21,
          ),

          const SizedBox(height: 20),

          // ── See all FAQ button ────────────────────────
          // width: 116.68, height: 34.14
          // left: 125.08, border-radius: 6.58
          // color: #3853A4
          Center(
            child: Container(
              width : 116.68,
              height: 34.14,
              decoration: BoxDecoration(
                color       : const Color(0xFF3853A4),
                borderRadius: BorderRadius.circular(6.58),
              ),
              child: Center(
                child: Text(
                  'See all FAQ',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13,
                    fontWeight: FontWeight.w600,
                    color     : Colors.white,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

        ],
      ),
    );
  }
}

// ── FAQ Item Widget ─────────────────────────────────────
class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool   isExpanded;
  final double questionWidth;
  final double questionLeft;
  final double answerWidth;
  final double answerLeft;

  const _FaqItem({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.questionWidth,
    required this.questionLeft,
    required this.answerWidth,
    required this.answerLeft,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem>
    with SingleTickerProviderStateMixin {

  late bool _isExpanded;
  late AnimationController _animController;
  late Animation<double>   _expandAnim;

  @override
  void initState() {
    super.initState();
    _isExpanded   = widget.isExpanded;
    _animController = AnimationController(
      vsync   : this,
      duration: const Duration(milliseconds: 200),
    );
    _expandAnim = CurvedAnimation(
      parent: _animController,
      curve : Curves.easeInOut,
    );
    if (_isExpanded) _animController.value = 1.0;
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animController.forward();
      } else {
        _animController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin     : const EdgeInsets.symmetric(
        horizontal: 12,
        vertical  : 4,
      ),
      decoration : BoxDecoration(
        color       : const Color(0xFF0F0F1E),
        borderRadius: BorderRadius.circular(8),
        border      : Border.all(
          color: const Color(0xFF1E1E3A),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Question row ──────────────────────────────
          GestureDetector(
            onTap: _toggle,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical  : 14,
              ),
              child: Row(
                children: [

                  // Question text
                  // width: 180 (first) or 94 (others), left: 32.1
                  // font: Montserrat Medium 500, 11.24px
                  Expanded(
                    child: Text(
                      widget.question,
                      style: GoogleFonts.montserrat(
                        fontSize  : 11.24,
                        fontWeight: FontWeight.w500,
                        color     : Colors.white,
                        height    : 1.0,
                        letterSpacing: 0,
                      ),
                    ),
                  ),

                  // Expand/collapse icon
                  AnimatedRotation(
                    turns   : _isExpanded ? 0 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child   : const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Colors.white,
                      size : 20,
                    ),
                  ),

                ],
              ),
            ),
          ),

          // ── Answer (expandable) ───────────────────────
          SizeTransition(
            sizeFactor: _expandAnim,
            child     : Container(
              padding: const EdgeInsets.only(
                left  : 16,
                right : 16,
                bottom: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Divider line
                  Container(
                    height: 1,
                    color : const Color(0xFF1E1E3A),
                    margin: const EdgeInsets.only(bottom: 10),
                  ),

                  // Answer text
                  // width: 317.64, left: 28.21
                  // font: Montserrat Medium 500, 11px, lh: 145%
                  SizedBox(
                    width: widget.answerWidth,
                    child: Text(
                      widget.answer,
                      style: GoogleFonts.montserrat(
                        fontSize  : 11,
                        fontWeight: FontWeight.w500,
                        color     : Colors.white70,
                        height    : 1.45,
                        letterSpacing: 0,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}