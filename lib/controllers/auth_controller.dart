import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {

  final supabase = Supabase.instance.client;

  // ── Loading state ─────────────────────────────────────
  final RxBool isLoading = false.obs;

  // ── Current user profile (available app-wide) ─────────
  final Rx<Map<String, dynamic>?> userProfile =
      Rx<Map<String, dynamic>?>(null);

  // ── Sign Up ─────────────────────────────────────────────
  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String cryptoAddress,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await supabase.auth.signUp(
        email   : email.trim(),
        password: password,
      );

      if (response.user != null) {
        // ── Insert profile data into 'profiles' table ────
        await supabase.from('profiles').insert({
          'id'            : response.user!.id,
          'first_name'    : firstName.trim(),
          'last_name'     : lastName.trim(),
          'full_name'     : fullName.trim(),
          'email'         : email.trim(),
          'phone_number'  : phoneNumber.trim(),
          'crypto_address': cryptoAddress.trim(),
          'created_at'    : DateTime.now().toIso8601String(),
        });

        userProfile.value = {
          'first_name'    : firstName,
          'last_name'     : lastName,
          'full_name'     : fullName,
          'email'         : email,
          'phone_number'  : phoneNumber,
          'crypto_address': cryptoAddress,
        };

        Get.snackbar(
          '✅ Account Created',
          'Welcome to Exodus, $firstName!',
          snackPosition  : SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF3853A4),
          colorText      : Colors.white,
          duration       : const Duration(seconds: 2),
        );

        Get.offAllNamed('/home');
      }
    } on AuthException catch (e) {
      Get.snackbar(
        '❌ Signup Failed',
        e.message,
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        '❌ Error',
        'Something went wrong. Please try again.',
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // ── Login ───────────────────────────────────────────────
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await supabase.auth.signInWithPassword(
        email   : email.trim(),
        password: password,
      );

      if (response.user != null) {
        await fetchUserProfile(response.user!.id);

        Get.snackbar(
          '✅ Welcome Back',
          'Logged in successfully',
          snackPosition  : SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF3853A4),
          colorText      : Colors.white,
          duration       : const Duration(seconds: 2),
        );

        Get.offAllNamed('/home');
      }
    } on AuthException catch (e) {
      Get.snackbar(
        '❌ Login Failed',
        e.message,
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        '❌ Error',
        'Something went wrong. Please try again.',
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // ── Fetch user profile (for use across app) ────────────
  Future<void> fetchUserProfile(String userId) async {
    try {
      final data = await supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();

      userProfile.value = data;
    } catch (e) {
      debugPrint('Failed to fetch profile: $e');
    }
  }

  // ── Logout ──────────────────────────────────────────────
  Future<void> logout() async {
    await supabase.auth.signOut();
    userProfile.value = null;
    Get.offAllNamed('/login');
  }

  // ── Check if already logged in (for app startup) ───────
  bool get isLoggedIn => supabase.auth.currentSession != null;

  // Add this method to your existing AuthController class:

// ── Update profile fields ──────────────────────────────
Future<void> updateProfile({
  required String firstName,
  required String lastName,
  required String fullName,
  required String email,
  required String phoneNumber,
  required String cryptoAddress,
}) async {
  try {
    isLoading.value = true;

    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    await supabase.from('profiles').update({
      'first_name'    : firstName.trim(),
      'last_name'     : lastName.trim(),
      'full_name'     : fullName.trim(),
      'email'         : email.trim(),
      'phone_number'  : phoneNumber.trim(),
      'crypto_address': cryptoAddress.trim(),
    }).eq('id', userId);

    // ── Refresh local reactive profile so UI updates instantly ──
    await fetchUserProfile(userId);

    Get.snackbar(
      '✅ Updated',
      'Your preferences have been saved',
      snackPosition  : SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF3853A4),
      colorText      : Colors.white,
      duration       : const Duration(seconds: 2),
    );
  } catch (e) {
    Get.snackbar(
      '❌ Error',
      'Failed to update preferences',
      snackPosition  : SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFB03A3A),
      colorText      : Colors.white,
    );
  } finally {
    isLoading.value = false;
  }
}
}