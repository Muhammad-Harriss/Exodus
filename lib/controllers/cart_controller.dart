import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartItem {
  final String imageName;
  final String title;
  final double price;
  RxInt  quantity;
  RxBool isFavourite;

  CartItem({
    required this.imageName,
    required this.title,
    required this.price,
    int  initialQty = 1,
    bool initialFav = false,
  }) : quantity    = initialQty.obs,
       isFavourite = initialFav.obs;
}

class CartController extends GetxController {

  final supabase = Supabase.instance.client;

  final RxList<CartItem> cartItems      = <CartItem>[].obs;
  final RxList<String>   purchasedTiers = <String>[].obs;

  int get totalItemCount =>
      cartItems.fold(0, (sum, item) => sum + item.quantity.value);

  double get totalPrice => cartItems.fold(
    0.0,
    (sum, item) => sum + (item.price * item.quantity.value),
  );

  CartItem? get latestTier =>
      cartItems.isNotEmpty ? cartItems.last : null;

  bool get isLatestTierActive {
    if (latestTier == null) return false;
    return purchasedTiers.contains(latestTier!.imageName);
  }

  // ── Add to cart + immediately save as not_completed ───
  void addToCart({
    required String imageName,
    required String title,
    required double price,
  }) {
    final index = cartItems.indexWhere(
      (item) => item.imageName == imageName,
    );
    if (index != -1) {
      cartItems[index].quantity.value++;
    } else {
      cartItems.add(CartItem(
        imageName: imageName,
        title    : title,
        price    : price,
      ));
    }
    cartItems.refresh();

    // ── Save immediately with price while cart item exists ──
    _savePurchaseRecord(
      title : title,
      price : price,
      status: 'not_completed',
    );

    Get.snackbar(
      '🛒 Added to Cart',
      '$title has been added to your cart',
      snackPosition  : SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF3853A4),
      colorText      : const Color(0xFFFFFFFF),
      duration       : const Duration(seconds: 2),
      margin         : const EdgeInsets.all(12),
      borderRadius   : 8,
    );
  }

  void increment(int index) {
    if (index < cartItems.length) {
      cartItems[index].quantity.value++;
      cartItems.refresh();
    }
  }

  void decrement(int index) {
    if (index < cartItems.length) {
      if (cartItems[index].quantity.value > 1) {
        cartItems[index].quantity.value--;
      } else {
        removeItem(index);
      }
      cartItems.refresh();
    }
  }

  // ── Remove → mark as cancelled ────────────────────────
  void removeItem(int index) {
    if (index < cartItems.length) {
      final item = cartItems[index];
      _updateStatusByTitle(
        title : item.title,
        status: 'cancelled',
      );
      cartItems.removeAt(index);
      cartItems.refresh();
    }
  }

  void toggleFavourite(int index) {
    if (index < cartItems.length) {
      cartItems[index].isFavourite.value =
          !cartItems[index].isFavourite.value;
      cartItems.refresh();
    }
  }

  // ── Called from OrderCompletedScreen ─────────────────
  // Receives either a clean title ("Tier 3 Upgrade") OR
  // a raw image path — handle both cases
  Future<void> markAsPurchased(String value) async {
    if (!purchasedTiers.contains(value)) {
      purchasedTiers.add(value);
      purchasedTiers.refresh();
    }

    // ── Resolve to clean title either way ────────────
    final cleanTitle = _isImagePath(value)
        ? _cleanTitleFromPath(value)
        : value; // already a clean title

    debugPrint('🟢 markAsPurchased → updating: "$cleanTitle"');

    await _updateStatusByTitle(
      title : cleanTitle,
      status: 'completed',
    );
  }

  // ── Mark with explicit title (from OrderCompletedScreen) ──
  Future<void> markAsPurchasedWithTitle({
    required String imageName,
    String?         title,
    double?         price,
  }) async {
    if (!purchasedTiers.contains(imageName)) {
      purchasedTiers.add(imageName);
      purchasedTiers.refresh();
    }

    final cleanTitle = (title != null && title.isNotEmpty)
        ? title
        : _isImagePath(imageName)
            ? _cleanTitleFromPath(imageName)
            : imageName;

    debugPrint('🟢 markAsPurchasedWithTitle → updating: "$cleanTitle"');

    await _updateStatusByTitle(
      title : cleanTitle,
      status: 'completed',
    );
  }

  // ── Internal: insert a new row ────────────────────────
  Future<void> _savePurchaseRecord({
    required String title,
    required double price,
    required String status,
  }) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) return;

      debugPrint('💾 Saving: "$title" | $status | \$$price');

      await supabase.from('purchases').insert({
        'user_id'     : userId,
        'title'       : title,
        'price'       : price,
        'status'      : status,
        'purchased_at': DateTime.now().toIso8601String(),
      });

      debugPrint('✅ Saved successfully');
    } catch (e) {
      debugPrint('❌ Failed to save: $e');
    }
  }

  // ── Internal: update most recent not_completed row ────
  Future<void> _updateStatusByTitle({
    required String title,
    required String status,
  }) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) return;

      debugPrint('🔄 Updating "$title" → $status');

      // ── Find the most recent not_completed row ────────
      final existing = await supabase
          .from('purchases')
          .select('id')
          .eq('user_id', userId)
          .eq('title', title)
          .eq('status', 'not_completed')
          .order('purchased_at', ascending: false)
          .limit(1)
          .maybeSingle();

      if (existing != null) {
        await supabase
            .from('purchases')
            .update({'status': status})
            .eq('id', existing['id']);

        debugPrint('✅ Updated row id: ${existing['id']} → $status');
      } else {
        debugPrint('⚠️ No not_completed row found for "$title"');
      }
    } catch (e) {
      debugPrint('❌ Failed to update: $e');
    }
  }

  // ── Check if a string is an image path ────────────────
  bool _isImagePath(String value) {
    return value.contains('assets/') ||
           value.contains('.png')    ||
           value.contains('.jpg');
  }

  // ── Convert image path → clean title ──────────────────
  String _cleanTitleFromPath(String imageName) {
    final lower = imageName.toLowerCase();
    if (lower.contains('tier4') || lower.contains('tier_4')) {
      return 'Tier 4 Upgrade';
    } else if (lower.contains('tier3') || lower.contains('tier_3')) {
      return 'Tier 3 Upgrade';
    } else if (lower.contains('tier2') || lower.contains('tier_2')) {
      return 'Tier 2 Upgrade';
    } else if (lower.contains('tier1') || lower.contains('tier_1')) {
      return 'Tier 1 Upgrade';
    } else if (lower.contains('tier0') || lower.contains('tier_0')) {
      return 'Tier 0 Upgrade';
    }
    return 'Tier Upgrade';
  }
}