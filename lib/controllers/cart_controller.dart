

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem {
  final String imageName;
  final String title;
  final double price;
  RxInt        quantity;

  CartItem({
    required this.imageName,
    required this.title,
    required this.price,
    int initialQty = 1,
  }) : quantity = initialQty.obs;
}

class CartController extends GetxController {

  // ── Cart items list ───────────────────────────────────
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  // ── Total item count ──────────────────────────────────
  RxInt get totalItemCount {
    final count = cartItems.fold(
      0, (sum, item) => sum + item.quantity.value,
    );
    return count.obs;
  }

  // ── Total price ───────────────────────────────────────
  double get totalPrice => cartItems.fold(
    0.0, (sum, item) => sum + (item.price * item.quantity.value),
  );

  // ── Add item ──────────────────────────────────────────
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

    // ── Show snackbar confirmation ─────────────────────
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

  // ── Increment ─────────────────────────────────────────
  void increment(int index) {
    if (index < cartItems.length) {
      cartItems[index].quantity.value++;
      cartItems.refresh();
    }
  }

  // ── Decrement ─────────────────────────────────────────
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

  // ── Remove ────────────────────────────────────────────
  void removeItem(int index) {
    if (index < cartItems.length) {
      cartItems.removeAt(index);
      cartItems.refresh();
    }
  }
}