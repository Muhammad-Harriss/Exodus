import 'package:flutter/material.dart';
import '../widgets/sections/auth/login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body           : const LoginSection(),
    );
  }
}