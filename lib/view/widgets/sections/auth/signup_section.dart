// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../../../../core/constants/app_images.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../screens/login_screen.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({super.key});

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {

  final authController = Get.put(AuthController());

  final _firstNameController     = TextEditingController();
  final _lastNameController      = TextEditingController();
  final _fullNameController      = TextEditingController();
  final _emailController         = TextEditingController();
  final _phoneController         = TextEditingController();
  final _cryptoAddressController = TextEditingController();
  final _passwordController      = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword        = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cryptoAddressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    // ── Basic validation ─────────────────────────────────
    if (_firstNameController.text.trim().isEmpty ||
        _lastNameController.text.trim().isEmpty ||
        _fullNameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _cryptoAddressController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      Get.snackbar(
        '⚠️ Missing Fields',
        'Please fill in all fields',
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      Get.snackbar(
        '⚠️ Password Mismatch',
        'Passwords do not match',
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
      return;
    }

    if (_passwordController.text.length < 6) {
      Get.snackbar(
        '⚠️ Weak Password',
        'Password must be at least 6 characters',
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
      return;
    }

    authController.signUp(
      firstName    : _firstNameController.text,
      lastName     : _lastNameController.text,
      fullName     : _fullNameController.text,
      email        : _emailController.text,
      phoneNumber  : _phoneController.text,
      cryptoAddress: _cryptoAddressController.text,
      password     : _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [

        // ── Background gradient ───────────────────────────
        Container(
          width : screenWidth,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin : Alignment.topCenter,
              end   : Alignment.bottomCenter,
              colors: [
                Color(0xFF0A0E27),
                Color(0xFF0F1B3D),
                Color(0xFF080818),
              ],
            ),
          ),
        ),

        // ── Floating glow decoration ──────────────────────
        Positioned(
          top : -80,
          left: -60,
          child: Container(
            width : 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF3853A4).withOpacity(0.35),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top  : 100,
          right: -80,
          child: Container(
            width : 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF00D4FF).withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // ── Scrollable content ────────────────────────────
        SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical  : 20,
            ),
            child  : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children          : [

                const SizedBox(height: 20),

                // ── App logo ─────────────────────────────
                Image.asset(
                  AppImages.exodusHeroLogo,
                  width : 160,
                  fit   : BoxFit.contain,
                ),

                const SizedBox(height: 28),

                // ── Heading ──────────────────────────────
                Text(
                  'Create Account',
                  style: GoogleFonts.montserrat(
                    fontSize  : 26,
                    fontWeight: FontWeight.w700,
                    color     : Colors.white,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'Join Exodus and start your journey',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13,
                    fontWeight: FontWeight.w400,
                    color     : Colors.white60,
                  ),
                ),

                const SizedBox(height: 30),

                // ── Glassmorphism form card ────────────────
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child       : BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                    child : Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color       : Colors.white.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(20),
                        border      : Border.all(
                          color: Colors.white.withOpacity(0.08),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [

                          // ── First Name / Last Name row ─────
                          Row(
                            children: [
                              Expanded(
                                child: _AuthTextField(
                                  controller: _firstNameController,
                                  label     : 'First Name',
                                  hint      : 'John',
                                  icon      : Icons.person_outline,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _AuthTextField(
                                  controller: _lastNameController,
                                  label     : 'Last Name',
                                  hint      : 'Doe',
                                  icon      : Icons.person_outline,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // ── Full Name ──────────────────────
                          _AuthTextField(
                            controller: _fullNameController,
                            label     : 'Full Name',
                            hint      : 'John Michael Doe',
                            icon      : Icons.badge_outlined,
                          ),

                          const SizedBox(height: 16),

                          // ── Email ──────────────────────────
                          _AuthTextField(
                            controller : _emailController,
                            label      : 'Email Address',
                            hint       : 'example@gmail.com',
                            icon       : Icons.mail_outline_rounded,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 16),

                          // ── Phone Number ───────────────────
                          _AuthTextField(
                            controller : _phoneController,
                            label      : 'Phone Number',
                            hint       : '+1 234 567 8900',
                            icon       : Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                          ),

                          const SizedBox(height: 16),

                          // ── Crypto Address ─────────────────
                          _AuthTextField(
                            controller: _cryptoAddressController,
                            label     : 'Crypto Wallet Address',
                            hint      : '0x1a2b3c...',
                            icon      : Icons.account_balance_wallet_outlined,
                          ),

                          const SizedBox(height: 16),

                          // ── Password ───────────────────────
                          _AuthTextField(
                            controller: _passwordController,
                            label     : 'Password',
                            hint      : '••••••••',
                            icon      : Icons.lock_outline_rounded,
                            obscureText: _obscurePassword,
                            suffixIcon : IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white38,
                                size : 18,
                              ),
                              onPressed: () => setState(() {
                                _obscurePassword = !_obscurePassword;
                              }),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // ── Confirm Password ───────────────
                          _AuthTextField(
                            controller : _confirmPasswordController,
                            label      : 'Confirm Password',
                            hint       : '••••••••',
                            icon       : Icons.lock_outline_rounded,
                            obscureText: _obscureConfirmPassword,
                            suffixIcon : IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white38,
                                size : 18,
                              ),
                              onPressed: () => setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              }),
                            ),
                          ),

                          const SizedBox(height: 26),

                          // ── Sign Up button ─────────────────
                          Obx(() => GestureDetector(
                            onTap: authController.isLoading.value
                                ? null
                                : _handleSignup,
                            child: Container(
                              width     : double.infinity,
                              height    : 52,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF3853A4),
                                    Color(0xFF4463BF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow   : [
                                  BoxShadow(
                                    color: const Color(0xFF3853A4)
                                        .withOpacity(0.4),
                                    blurRadius: 16,
                                    offset    : const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: authController.isLoading.value
                                    ? const SizedBox(
                                        width : 22,
                                        height: 22,
                                        child : CircularProgressIndicator(
                                          color     : Colors.white,
                                          strokeWidth: 2.4,
                                        ),
                                      )
                                    : Text(
                                        'Create Account',
                                        style: GoogleFonts.montserrat(
                                          fontSize  : 16,
                                          fontWeight: FontWeight.w600,
                                          color     : Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          )),

                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ── Already have account → Login ────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children         : [
                    Text(
                      'Already have an account? ',
                      style: GoogleFonts.montserrat(
                        fontSize  : 13,
                        color     : Colors.white60,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(() => const LoginScreen());
                      },
                      child: Text(
                        'Log In',
                        style: GoogleFonts.montserrat(
                          fontSize  : 13,
                          fontWeight: FontWeight.w700,
                          color     : const Color(0xFF6080DE),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

              ],
            ),
          ),
        ),

      ],
    );
  }
}

// ── Reusable Auth Text Field ────────────────────────────
class _AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String       label;
  final String       hint;
  final IconData     icon;
  final bool         obscureText;
  final Widget?      suffixIcon;
  final TextInputType keyboardType;

  const _AuthTextField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [

        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize  : 12,
            fontWeight: FontWeight.w500,
            color     : Colors.white70,
          ),
        ),

        const SizedBox(height: 6),

        Container(
          height: 48,
          decoration: BoxDecoration(
            color       : Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(10),
            border      : Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: TextField(
            controller  : controller,
            obscureText : obscureText,
            keyboardType: keyboardType,
            style       : GoogleFonts.montserrat(
              fontSize  : 13,
              fontWeight: FontWeight.w500,
              color     : Colors.white,
            ),
            decoration: InputDecoration(
              hintText : hint,
              hintStyle: GoogleFonts.montserrat(
                fontSize  : 12,
                fontWeight: FontWeight.w400,
                color     : Colors.white30,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.white38,
                size : 18,
              ),
              suffixIcon    : suffixIcon,
              border        : InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
            ),
          ),
        ),

      ],
    );
  }
}