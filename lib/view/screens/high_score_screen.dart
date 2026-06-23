// ignore_for_file: deprecated_member_use

import 'package:exous/core/constants/app_images.dart';
import 'package:exous/view/widgets/sections/highscore/highscore_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exous/view/widgets/sections/navbar_widget.dart';

class HighscoreScreen extends StatefulWidget {
  const HighscoreScreen({super.key});

  @override
  State<HighscoreScreen> createState() => _HighscoreScreenState();
}

class _HighscoreScreenState extends State<HighscoreScreen> {
  String activeSubTab = 'Profile';
  bool isWalletConnected = false;
  String? selectedLeaderboardPlayer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body: SafeArea(
        child: Column(
          children: [
            const NavbarWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 22, 12, 24),
                child: Column(
                  children: [
                    // ── Sub-Navigation Tabs ───────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSubTabButton('Profile'),
                        _buildSubTabButton('Leaderboard'),
                        _buildSubTabButton('Select skills'),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // ── Main Content Container Card ───────────────
                    Expanded(
                      child: Container(
                        width: 350.99,
                        decoration: BoxDecoration(
                          color: const Color(0xFF141424),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFF2A2A4A).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: _buildCurrentSubView(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentSubView() {
    if (activeSubTab == 'Leaderboard') {
      if (selectedLeaderboardPlayer != null) {
        return _buildScrollablePlayerDetailView(selectedLeaderboardPlayer!);
      }
      return HighScoreWidget(
        onPlayerTap: (username) {
          setState(() {
            selectedLeaderboardPlayer = username;
          });
        },
      );
    } else if (activeSubTab == 'Profile') {
      return isWalletConnected
          ? _buildScrollablePlayerDetailView('JoshuaJTV', isOwnProfile: true)
          : _buildDisconnectedWalletView();
    } else {
      // ── Select Skills tab ─────────────────────────────
      return _buildSelectSkillsView();
    }
  }

  /// ── SELECT SKILLS VIEW ──────────────────────────────────
  Widget _buildSelectSkillsView() {
    // ── 15 skill slots: 1 gold + 6 skills + 8 locked ─────
    // Locked slots show only the black coin base (no symbol)
    final List<_SkillCoin> skills = [
      // Row 1
      _SkillCoin(
        basePath: AppImages.coin, // gold coin — active
        symbolPath: null,
        isActive: true,
        isLocked: false,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: AppImages.coinMinig,
        isActive: false,
        isLocked: false,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: AppImages.coinFishing,
        isActive: false,
        isLocked: false,
      ),

      // Row 2
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: AppImages.coinForging,
        isActive: false,
        isLocked: false,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: AppImages.coinCooking,
        isActive: false,
        isLocked: false,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: AppImages.coinWorkshop,
        isActive: false,
        isLocked: false,
      ),

      // Row 3
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: AppImages.coinWoodChopping,
        isActive: false,
        isLocked: false,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: null,
        isActive: false,
        isLocked: true, // locked — no symbol yet
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: null,
        isActive: false,
        isLocked: true,
      ),

      // Row 4
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: null,
        isActive: false,
        isLocked: true,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: null,
        isActive: false,
        isLocked: true,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: null,
        isActive: false,
        isLocked: true,
      ),

      // Row 5
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: null,
        isActive: false,
        isLocked: true,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: null,
        isActive: false,
        isLocked: true,
      ),
      _SkillCoin(
        basePath: AppImages.blackcoin,
        symbolPath: null,
        isActive: false,
        isLocked: true,
      ),
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── "SELECT SKILL" heading ────────────────────
            Text(
              'SELECT SKILL',
              style: GoogleFonts.montserrat(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF),
                height: 1.0,
                letterSpacing: 0,
              ),
            ),

            const SizedBox(height: 28),

            // ── 5 × 3 grid ────────────────────────────────
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 1,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return _SkillCoinWidget(skill: skills[index]);
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ── Scrollable Profile Details Layout ────────────────────
  Widget _buildScrollablePlayerDetailView(
    String username, {
    bool isOwnProfile = false,
  }) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 14),

          if (!isOwnProfile)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: InkWell(
                  onTap: () => setState(() => selectedLeaderboardPlayer = null),
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1F35),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Back',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4463BF),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppImages.partnerjoshua,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => const Icon(
                            Icons.person,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      username,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0x1A000000),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildProfileStatColumn('Rank', '9', showBlackCoin: true),
                      _buildProfileStatColumn('XP', '104,206,805'),
                      _buildProfileStatColumn('Level', '1,208'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 22.0,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.blackcoin,
                      width: 20,
                      height: 20,
                      errorBuilder: (c, e, s) => const Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                    const Spacer(flex: 2),
                    Text(
                      '16,581,607',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(flex: 3),
                    Text(
                      '10000',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          if (isOwnProfile) ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Divider(color: Colors.white24, height: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 22.0,
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.coin,
                    width: 14,
                    height: 14,
                    errorBuilder: (c, e, s) => const Icon(
                      Icons.monetization_on,
                      color: Colors.amber,
                      size: 14,
                    ),
                  ),
                  const SizedBox(width: 36),
                  Text(
                    '17',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Total Metamoney',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '134,276',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 20),

          if (!isOwnProfile) ...[
            _buildMiniLeaderboardSlice(),
            const SizedBox(height: 24),
            _buildEquipmentGridSection(),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }

  Widget _buildMiniLeaderboardSlice() {
    final List<Map<String, dynamic>> sliceItems = [
      {
        'rank': '4',
        'name': 'JoshuaJTV',
        'xp': '16,581,607',
        'lvl': '10000',
        'hl': false,
      },
      {
        'rank': '1',
        'name': 'JoshuaJTV',
        'xp': '16,581,607',
        'lvl': '9000',
        'hl': false,
      },
      {
        'rank': '2',
        'name': 'JoshuaJTV',
        'xp': '16,581,607',
        'lvl': '8000',
        'hl': false,
      },
      {
        'rank': '3',
        'name': 'JoshuaJTV',
        'xp': '16,581,607',
        'lvl': '7000',
        'hl': false,
      },
      {
        'rank': '4',
        'name': 'JoshuaJTV',
        'xp': '16,581,607',
        'lvl': '2500',
        'hl': false,
      },
      {
        'rank': '5',
        'name': 'Andrew joah',
        'xp': '16,581,607',
        'lvl': '2300',
        'hl': true,
      },
      {
        'rank': '6',
        'name': 'JoshuaJTV',
        'xp': '16,581,607',
        'lvl': '2000',
        'hl': false,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0x12000000),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rank',
                style: GoogleFonts.montserrat(
                  fontSize: 9,
                  color: Colors.white38,
                ),
              ),
              Text(
                'Name',
                style: GoogleFonts.montserrat(
                  fontSize: 9,
                  color: Colors.white38,
                ),
              ),
              Text(
                'Total XP',
                style: GoogleFonts.montserrat(
                  fontSize: 9,
                  color: Colors.white38,
                ),
              ),
              Text(
                'Total Level',
                style: GoogleFonts.montserrat(
                  fontSize: 9,
                  color: Colors.white38,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white12),
          ListView.builder(
            itemCount: sliceItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) {
              final item = sliceItems[idx];
              final bool isHl = item['hl'] as bool;
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                decoration: BoxDecoration(
                  color: isHl ? const Color(0x214463BF) : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      child: Text(
                        item['rank'],
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isHl ? Colors.amber : Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item['name'],
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          color: isHl ? Colors.amber : Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      item['xp'],
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: isHl ? Colors.amber : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Text(
                      item['lvl'],
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: isHl ? Colors.amber : Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEquipmentGridSection() {
    final List<IconData> placementIcons = [
      Icons.waves,
      Icons.bar_chart,
      Icons.kebab_dining,
      Icons.anchor,
      Icons.gavel,
      Icons.colorize,
      Icons.architecture,
      Icons.cleaning_services,
      Icons.build,
      Icons.shield,
      Icons.hardware,
      Icons.handyman,
      Icons.plumbing,
      Icons.construction,
      Icons.layers,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: placementIcons.length,
        itemBuilder: (context, index) {
          final bool isFirst = index == 0;
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF232335),
              border: Border.all(
                color: isFirst
                    ? const Color(0xFF5D71B7)
                    : const Color(0xFF3A3A56),
                width: isFirst ? 2 : 1,
              ),
              boxShadow: isFirst
                  ? [
                      BoxShadow(
                        color: const Color(0xFF4463BF).withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Icon(
                placementIcons[index],
                color: isFirst
                    ? const Color(0xFF5D71B7)
                    : const Color(0xFF555566),
                size: 24,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileStatColumn(
    String label,
    String value, {
    bool showBlackCoin = false,
  }) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showBlackCoin)
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Image.asset(
                  AppImages.blackcoin,
                  width: 14,
                  height: 14,
                  errorBuilder: (c, e, s) =>
                      const Icon(Icons.circle, color: Colors.grey, size: 12),
                ),
              ),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: label == 'XP' ? const Color(0xFF4463BF) : Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildDisconnectedWalletView() {
    return Center(
      child: Container(
        width: 316,
        height: 195,
        decoration: BoxDecoration(
          color: const Color(0x36000000),
          borderRadius: BorderRadius.circular(11.92),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Connect wallet to view profile',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 14.44,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFCFCFC),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 112.74,
              height: 31.71,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3853A4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 0,
                ),
                onPressed: () => setState(() => isWalletConnected = true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.credit_card_rounded,
                      color: Colors.white,
                      size: 12.33,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Connect wallet',
                      style: GoogleFonts.montserrat(
                        fontSize: 7.7,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubTabButton(String label) {
    final bool isActive = activeSubTab == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          activeSubTab = label;
          if (label != 'Leaderboard') {
            selectedLeaderboardPlayer = null;
          }
        });
      },
      child: Container(
        width: 105.02,
        height: 26.98,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF3853A4) : Colors.transparent,
          borderRadius: BorderRadius.circular(7.21),
          border: Border.all(color: const Color(0xFF5D71B7), width: 1.48),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 11.6,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFCFCFC),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Skill coin data model ───────────────────────────────
class _SkillCoin {
  final String basePath; // black coin or gold coin base image
  final String? symbolPath; // symbol overlaid on top (null if locked)
  final bool isActive; // gold glow
  final bool isLocked; // dim overlay for unearned slots

  const _SkillCoin({
    required this.basePath,
    required this.isActive,
    required this.isLocked,
    this.symbolPath,
  });
}

// ── Skill coin widget ───────────────────────────────────
class _SkillCoinWidget extends StatelessWidget {
  final _SkillCoin skill;

  const _SkillCoinWidget({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: skill.isActive
            ? [
                BoxShadow(
                  color: const Color(0xFFFFB300).withOpacity(0.55),
                  blurRadius: 16,
                  spreadRadius: 3,
                ),
              ]
            : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ── Base coin (black or gold) ─────────────────
          Image.asset(
            skill.basePath,
            fit: BoxFit.contain,
            // Dim locked coins so they look greyed out
            color: skill.isLocked ? Colors.white.withOpacity(0.25) : null,
            colorBlendMode: skill.isLocked ? BlendMode.modulate : null,
            errorBuilder: (c, e, s) => Container(
              decoration: const BoxDecoration(
                color: Color(0xFF232335),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ── Symbol overlaid on top ─────────────────────
          // Only shown when symbolPath is not null
          if (skill.symbolPath != null)
            Positioned.fill(
              child: Padding(
                // Inset so symbol sits inside the coin rim
                padding: const EdgeInsets.all(14),
                child: Image.asset(
                  skill.symbolPath!,
                  fit: BoxFit.contain,
                  errorBuilder: (c, e, s) => const SizedBox.shrink(),
                ),
              ),
            ),

          // ── Lock icon on locked slots ──────────────────
          if (skill.isLocked)
            const Icon(
              Icons.lock_outline_rounded,
              color: Colors.white24,
              size: 18,
            ),
        ],
      ),
    );
  }
}
