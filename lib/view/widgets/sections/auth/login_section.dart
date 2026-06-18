// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../../../../core/constants/app_images.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../screens/signup_screen.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {

  final authController = Get.put(AuthController());

  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      Get.snackbar(
        '⚠️ Missing Fields',
        'Please enter email and password',
        snackPosition  : SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB03A3A),
        colorText      : Colors.white,
      );
      return;
    }

    authController.login(
      email   : _emailController.text,
      password: _passwordController.text,
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

        // ── Floating glow decorations ─────────────────────
        Positioned(
          top : -60,
          right: -60,
          child: Container(
            width : 220,
            height: 220,
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
          bottom: 80,
          left  : -70,
          child : Container(
            width : 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF00D4FF).withOpacity(0.18),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // ── Content ────────────────────────────────────────
        SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child  : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children          : [

                const SizedBox(height: 60),

                // ── App logo ─────────────────────────────
                Image.asset(
                  AppImages.exodusHeroLogo,
                  width : 180,
                  fit   : BoxFit.contain,
                ),

                const SizedBox(height: 36),

                Text(
                  'Welcome Back',
                  style: GoogleFonts.montserrat(
                    fontSize  : 28,
                    fontWeight: FontWeight.w700,
                    color     : Colors.white,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'Log in to continue your journey',
                  style: GoogleFonts.montserrat(
                    fontSize  : 13,
                    fontWeight: FontWeight.w400,
                    color     : Colors.white60,
                  ),
                ),

                const SizedBox(height: 36),

                // ── Glassmorphism form card ───────────────
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child       : BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                    child : Container(
                      padding: const EdgeInsets.all(22),
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

                          // ── Email ──────────────────────────
                          _LoginTextField(
                            controller  : _emailController,
                            label       : 'Email Address',
                            hint        : 'example@gmail.com',
                            icon        : Icons.mail_outline_rounded,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 18),

                          // ── Password ───────────────────────
                          _LoginTextField(
                            controller : _passwordController,
                            label      : 'Password',
                            hint       : '••••••••',
                            icon       : Icons.lock_outline_rounded,
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

                          const SizedBox(height: 12),

                          Align(
                            alignment: Alignment.centerRight,
                            child    : Text(
                              'Forgot Password?',
                              style: GoogleFonts.montserrat(
                                fontSize  : 12,
                                fontWeight: FontWeight.w500,
                                color     : const Color(0xFF6080DE),
                              ),
                            ),
                          ),

                          const SizedBox(height: 26),

                          // ── Login button ───────────────────
                          Obx(() => GestureDetector(
                            onTap: authController.isLoading.value
                                ? null
                                : _handleLogin,
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
                                        'Log In',
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

                const SizedBox(height: 28),

                // ── Sign up link ─────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children         : [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.montserrat(
                        fontSize  : 13,
                        color     : Colors.white60,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(() => const SignupScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                          fontSize  : 13,
                          fontWeight: FontWeight.w700,
                          color     : const Color(0xFF6080DE),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

              ],
            ),
          ),
        ),

      ],
    );
  }
}

// ── Reusable Login Text Field ───────────────────────────
class _LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String       label;
  final String       hint;
  final IconData     icon;
  final bool         obscureText;
  final Widget?      suffixIcon;
  final TextInputType keyboardType;

  const _LoginTextField({
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
          height: 50,
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
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),

      ],
    );
  }
}