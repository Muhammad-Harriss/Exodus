import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../widgets/sections/navbar_widget.dart';
import 'home_screen.dart'; 

class OrderCompletedScreen extends StatelessWidget {
  final List upgradedItems;
  final String maskedCardNumber;
  final String orderTotalPrice;
  final String cryptoAddress;
  final String orderIdNumber;
  final String txHashUrl;

  const OrderCompletedScreen({
    super.key,
    required this.upgradedItems,
    required this.maskedCardNumber,
    required this.orderTotalPrice,
    required this.cryptoAddress,
    required this.orderIdNumber,
    required this.txHashUrl,
  });

  /// Automatically matches and returns the exact tier image asset path
  String _getAssetImage(Map item) {
    if (item['imageName'] != null && item['imageName'].toString().isNotEmpty) {
      return item['imageName'];
    }
    
    final String title = (item['title'] ?? '').toString().toLowerCase();
    
    if (title.contains('tier 1')) {
      return 'assets/images/tier1.png';
    } else if (title.contains('tier 2')) {
      return 'assets/images/tier2.png';
    } else if (title.contains('tier 3')) {
      return 'assets/images/tier3.png';
    } else if (title.contains('tier 4')) {
      return 'assets/images/tier4.png';
    }
    
    return 'assets/images/tier4.png'; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavbarWidget(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Back To Shop Action Button Component
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => Get.offAll(() => const HomeScreen()),
                        child: Container(
                          width: 145.23,
                          height: 38.79,
                          decoration: BoxDecoration(
                            color: const Color(0xFF141A33),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF4463BF), size: 12),
                              const SizedBox(width: 8),
                              Text(
                                'Back to shop',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.78, 
                                  fontWeight: FontWeight.w600, 
                                  color: const Color(0xFF4463BF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Success Headline Section
                    Text(
                      'Congratulations! your order\nis completed',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 19.29, 
                        fontWeight: FontWeight.w600, 
                        color: const Color(0xFF6D88DB), 
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Purchased Items Dynamic List View
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: upgradedItems.length,
                      itemBuilder: (context, index) {
                        final item = upgradedItems[index];
                        return Container(
                          width: double.infinity,
                          height: 115,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF110B22), 
                            border: Border.all(color: const Color(0xFF23143A), width: 1),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              
                              // Dynamically Selected Image Container
                              Container(
                                width: 76,
                                height: 76,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF180A2B),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: const Color(0xFFFFB300), width: 1), 
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset(
                                    _getAssetImage(item),
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: const Color(0xFF25183A),
                                        child: const Icon(Icons.broken_image, color: Colors.amber, size: 28),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (item['title'] ?? 'UPGRADE TIER').toString().toUpperCase(),
                                      style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                                    ),
                                    const SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: Text(
                                        'Gives all configuration access for this service upgrade path package, including active unlocks.',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white70),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 12),

                    // Order Details Summary Component Box
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B0B16), 
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF1C1C30), width: 1),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          _buildDetailsRow('Card number', maskedCardNumber),
                          const Divider(color: Color(0xFF18182B), height: 24, thickness: 1),
                          _buildDetailsRow('Items (${upgradedItems.length})', orderTotalPrice),
                          const Divider(color: Color(0xFF18182B), height: 24, thickness: 1),
                          _buildDetailsRow('Crypto address sent to', cryptoAddress),
                          const Divider(color: Color(0xFF18182B), height: 24, thickness: 1),
                          _buildDetailsRow('Order number', orderIdNumber),
                          const Divider(color: Color(0xFF18182B), height: 24, thickness: 1),
                          
                          // Hash link summary layout - Handled safely with Expanded
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hash',
                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: Text(
                                  txHashUrl,
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10, 
                                    fontWeight: FontWeight.w400, 
                                    color: const Color(0xFF4463BF), 
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Updated layout builder constructor row logic to eliminate flex constraints errors
  Widget _buildDetailsRow(String label, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start, // Handles clean top alignment if wrapped
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70),
        ),
        const SizedBox(width: 24), // Ensures safe baseline content separation gap
        Expanded(
          child: Text(
            data,
            textAlign: TextAlign.end,
            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ],
    );
  }
}