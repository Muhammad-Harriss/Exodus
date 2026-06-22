// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../controllers/auth_controller.dart';

enum PurchaseStatus { notCompleted, completed, cancelled }

class PurchaseItem {
  final String         title;
  final String         date;
  final double         price;
  final PurchaseStatus status;

  const PurchaseItem({
    required this.title,
    required this.date,
    required this.price,
    required this.status,
  });
}

class BillingSection extends StatefulWidget {
  const BillingSection({super.key});

  @override
  State<BillingSection> createState() => _BillingSectionState();
}

class _BillingSectionState extends State<BillingSection> {

  final authController = Get.find<AuthController>();
  final supabase       = Supabase.instance.client;

  final Set<int>             _expandedIndexes = {};
  final RxList<PurchaseItem> _purchases       = <PurchaseItem>[].obs;
  final RxBool               _isLoading       = true.obs;

  @override
  void initState() {
    super.initState();
    _fetchPurchases();
  }

  Future<void> _fetchPurchases() async {
    try {
      _isLoading.value = true;

      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        _isLoading.value = false;
        return;
      }

      final data = await supabase
          .from('purchases')
          .select()
          .eq('user_id', userId)
          .order('purchased_at', ascending: false);

      _purchases.value = (data as List).map((row) {
        return PurchaseItem(
          title : _cleanTitle(row['title'] ?? 'Unknown'),
          price : (row['price'] as num).toDouble(),
          date  : _formatDate(row['purchased_at']),
          status: _parseStatus(row['status']),
        );
      }).toList();

    } catch (e) {
      debugPrint('Failed to fetch purchases: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  String _cleanTitle(String raw) {
    if (!raw.contains('assets/') && !raw.contains('.png')) return raw;
    final lower = raw.toLowerCase();
    if (lower.contains('tier4') || lower.contains('tier_4')) return 'Tier 4 Upgrade';
    if (lower.contains('tier3') || lower.contains('tier_3')) return 'Tier 3 Upgrade';
    if (lower.contains('tier2') || lower.contains('tier_2')) return 'Tier 2 Upgrade';
    if (lower.contains('tier1') || lower.contains('tier_1')) return 'Tier 1 Upgrade';
    if (lower.contains('tier0') || lower.contains('tier_0')) return 'Tier 0 Upgrade';
    return 'Tier Upgrade';
  }

  String _formatDate(String? isoDate) {
    if (isoDate == null) return '—';
    try {
      final dt = DateTime.parse(isoDate).toLocal();
      return '${dt.day.toString().padLeft(2, '0')}/'
             '${dt.month.toString().padLeft(2, '0')}/'
             '${dt.year}';
    } catch (_) {
      return '—';
    }
  }

  PurchaseStatus _parseStatus(String? status) {
    switch (status) {
      case 'completed'    : return PurchaseStatus.completed;
      case 'cancelled'    : return PurchaseStatus.cancelled;
      default             : return PurchaseStatus.notCompleted;
    }
  }

  void _toggleExpand(int index) {
    setState(() {
      if (_expandedIndexes.contains(index)) {
        _expandedIndexes.remove(index);
      } else {
        _expandedIndexes.add(index);
      }
    });
  }

  String _statusLabel(PurchaseStatus status) {
    switch (status) {
      case PurchaseStatus.notCompleted: return 'Not completed';
      case PurchaseStatus.completed   : return 'Completed';
      case PurchaseStatus.cancelled   : return 'Cancelled';
    }
  }

  Color _statusColor(PurchaseStatus status) {
    switch (status) {
      case PurchaseStatus.notCompleted: return const Color(0xFFE0492A);
      case PurchaseStatus.completed   : return const Color(0xFF58CB11);
      case PurchaseStatus.cancelled   : return const Color(0xFFAAAAAA);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final profile     = authController.userProfile.value;

    return Container(
      width : screenWidth,
      color : const Color(0xFF080818),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child  : Container(
              width     : double.infinity,
              decoration: BoxDecoration(
                color       : const Color(0xFF0A0A0A),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical  : 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children          : [

                  Text(
                    'Previous purchases',
                    style: GoogleFonts.montserrat(
                      fontSize  : 17.22,
                      fontWeight: FontWeight.w500,
                      color     : Colors.white,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Obx(() {

                    if (_isLoading.value) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child  : Center(
                          child: CircularProgressIndicator(
                            color     : Color(0xFF3853A4),
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    }

                    if (_purchases.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child  : Text(
                          'No purchases yet',
                          style: GoogleFonts.montserrat(
                            fontSize  : 13,
                            fontWeight: FontWeight.w400,
                            color     : Colors.white38,
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: List.generate(_purchases.length, (index) {
                        final item       = _purchases[index];
                        final isExpanded = _expandedIndexes.contains(index);

                        return Column(
                          children: [

                            // ── Collapsed row ──────────
                            GestureDetector(
                              onTap: () => _toggleExpand(index),
                              child: Container(
                                width  : double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical  : 10,
                                ),
                                decoration: BoxDecoration(
                                  border: isExpanded
                                      ? Border(
                                          left: BorderSide(
                                            color: _statusColor(item.status),
                                            width: 3,
                                          ),
                                        )
                                      : null,
                                ),
                                child: Row(
                                  children: [

                                    Expanded(
                                      child: Text(
                                        item.title,
                                        style: GoogleFonts.montserrat(
                                          fontSize  : 13.7,
                                          fontWeight: FontWeight.w500,
                                          color     : Colors.white,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      item.date,
                                      style: GoogleFonts.montserrat(
                                        fontSize  : 13.7,
                                        fontWeight: FontWeight.w500,
                                        color     : Colors.white,
                                      ),
                                    ),

                                    const SizedBox(width: 8),

                                    AnimatedRotation(
                                      turns   : isExpanded ? 0.5 : 0,
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      child: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.white,
                                        size : 18,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            // ── Expanded detail ─────────
                            // Price on LEFT, Status on RIGHT ──
                            if (isExpanded)
                              Container(
                                width  : double.infinity,
                                padding: const EdgeInsets.fromLTRB(
                                  11, 4, 11, 12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [

                                    // ── Price (left) ────
                                    Row(
                                      children: [
                                        Text(
                                          'Price: ',
                                          style: GoogleFonts.montserrat(
                                            fontSize  : 12,
                                            fontWeight: FontWeight.w500,
                                            color     : Colors.white60,
                                          ),
                                        ),
                                        Text(
                                          item.price > 0
                                              ? '\$${item.price.toStringAsFixed(0)}'
                                              : '—',
                                          style: GoogleFonts.montserrat(
                                            fontSize  : 12,
                                            fontWeight: FontWeight.w700,
                                            color     : const Color(
                                              0xFF3B8C3F,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // ── Status (right) ───
                                    Row(
                                      children: [
                                        Text(
                                          'Status: ',
                                          style: GoogleFonts.montserrat(
                                            fontSize  : 12,
                                            fontWeight: FontWeight.w500,
                                            color     : Colors.white60,
                                          ),
                                        ),
                                        Text(
                                          _statusLabel(item.status),
                                          style: GoogleFonts.montserrat(
                                            fontSize  : 12,
                                            fontWeight: FontWeight.w700,
                                            color     : _statusColor(
                                              item.status,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),

                            if (index < _purchases.length - 1)
                              Divider(
                                color    : Colors.white.withOpacity(0.07),
                                height   : 1,
                                thickness: 1,
                              ),

                          ],
                        );
                      }),
                    );
                  }),

                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child  : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children          : [

                Text(
                  'Billing Email',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13.26,
                    fontWeight: FontWeight.w700,
                    color     : Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  profile?['email'] ?? '—',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13.26,
                    fontWeight: FontWeight.w400,
                    color     : Colors.white70,
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  'Billing Address',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13.26,
                    fontWeight: FontWeight.w700,
                    color     : Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  profile?['billing_address'] ??
                      '1600 Pennsylvania Avenue NW, Washington DC',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13.26,
                    fontWeight: FontWeight.w400,
                    color     : Colors.white70,
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  'Full name',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13.26,
                    fontWeight: FontWeight.w700,
                    color     : Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  profile?['full_name'] ?? '—',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13.26,
                    fontWeight: FontWeight.w400,
                    color     : Colors.white70,
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  'Wallet address',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13.26,
                    fontWeight: FontWeight.w700,
                    color     : Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  profile?['crypto_address'] ?? '—',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13.26,
                    fontWeight: FontWeight.w400,
                    color     : Colors.white70,
                  ),
                ),

                const SizedBox(height: 28),

                Container(
                  width : 144.55,
                  height: 37.13,
                  decoration: BoxDecoration(
                    color       : const Color(0xFF3853A4),
                    borderRadius: BorderRadius.circular(9.92),
                    border      : Border.all(
                      color: const Color(0xFF4463BF),
                      width: 2.04,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children         : [
                      const Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.white,
                        size : 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Need help?',
                        style: GoogleFonts.montserrat(
                          fontSize  : 12.6,
                          fontWeight: FontWeight.w600,
                          color     : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

              ],
            ),
          ),

        ],
      ),
    );
  }
}