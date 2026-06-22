import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HighScoreWidget extends StatefulWidget {
  // Added a callback function to handle player selection clicks
  final Function(String username) onPlayerTap;

  const HighScoreWidget({super.key, required this.onPlayerTap});

  @override
  State<HighScoreWidget> createState() => _HighScoreWidgetState();
}

class _HighScoreWidgetState extends State<HighScoreWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leaderboardEntries = [
      {'rank': '4', 'name': 'JoshuaJTV', 'xp': '16,581,607', 'level': '10000', 'isSelected': true},
      {'rank': '1', 'name': 'JoshuaJTV', 'xp': '16,581,607', 'level': '9000', 'isSelected': false},
      {'rank': '2', 'name': 'JoshuaJTV', 'xp': '16,581,607', 'level': '8000', 'isSelected': false},
      {'rank': '3', 'name': 'JoshuaJTV', 'xp': '16,581,607', 'level': '7000', 'isSelected': false},
      {'rank': '4', 'name': 'JoshuaJTV', 'xp': '16,581,607', 'level': '2500', 'isSelected': false},
      {'rank': '5', 'name': 'Andrew joah', 'xp': '16,581,607', 'level': '2300', 'isSelected': false},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: [
          Text(
            'RANKING',
            style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 14),

          // Headers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                SizedBox(width: 32, child: _tableHeader('Rank')),
                Expanded(flex: 3, child: _tableHeader('Name')),
                Expanded(flex: 2, child: _tableHeader('Total XP')),
                SizedBox(
                  width: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.stars, color: Colors.amber, size: 11),
                      const SizedBox(width: 3),
                      _tableHeader('Total Level'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white12, height: 1),
          const SizedBox(height: 8),

          // Search Field
          Container(
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F35),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white12, width: 0.8),
            ),
            child: TextField(
              controller: _searchController,
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 10),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.white38, size: 13),
                hintText: 'Type player username',
                hintStyle: GoogleFonts.montserrat(color: Colors.white38, fontSize: 9.5),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 11),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Interactive List View
          Expanded(
            child: ListView.builder(
              itemCount: leaderboardEntries.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final entry = leaderboardEntries[index];
                final bool isSelected = entry['isSelected'] as bool;

                // FIX: Wrapped user row entry inside a GestureDetector
                return GestureDetector(
                  onTap: () {
                    // Triggers screen relocation callback with username variable
                    widget.onPlayerTap(entry['name']);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0x214463BF) : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      gradient: isSelected ? const LinearGradient(
                        colors: [Color(0x333853A4), Color(0x003853A4)],
                      ) : null,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 28,
                          child: Text(
                            entry['rank']!,
                            style: GoogleFonts.montserrat(
                              fontSize: 10.5, 
                              fontWeight: FontWeight.w700, 
                              color: isSelected ? const Color(0xFF5D71B7) : Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Container(
                                width: 14,
                                height: 14,
                                decoration: const BoxDecoration(color: Color(0xFF4463BF), shape: BoxShape.circle),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/joshua_icon.png',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 9, color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  entry['name']!,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10, 
                                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600, 
                                    color: isSelected ? Colors.white : const Color(0xFFB0B3C7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            entry['xp']!,
                            style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          child: Text(
                            entry['level']!,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader(String text) => Text(text, style: GoogleFonts.montserrat(fontSize: 9, fontWeight: FontWeight.w500, color: Colors.white38));
}