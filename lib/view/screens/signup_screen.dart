import 'package:flutter/material.dart';
import '../widgets/sections/auth/signup_section.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body           : const SignupSection(),
    );
  }
}