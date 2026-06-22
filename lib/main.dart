// ignore_for_file: deprecated_member_use

import 'package:exous/controllers/navigation_controller.dart';
import 'package:exous/controllers/auth_controller.dart';
import 'package:exous/view/screens/home_screen.dart';
import 'package:exous/view/screens/login_screen.dart';
import 'package:exous/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:exous/controllers/cart_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── Initialize Supabase Database Connection ────────
  await Supabase.initialize(
    url: 'https://wwtjsyulobilisxtjluo.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind3dGpzeXVsb2JpbGlzeHRqbHVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE1OTc1ODYsImV4cCI6MjA5NzE3MzU4Nn0.heJTNxGZrK5UgWV68xM8TrIAfwaZ5NuP1bvzB_cQiPg',
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // ── Initialize Controllers globally ────────────────
  Get.put(CartController());
  Get.put(NavigationController());
  Get.put(AuthController());

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ExodusApp(),
    ),
  );
}

class ExodusApp extends StatelessWidget {
  const ExodusApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF080818),
        brightness: Brightness.dark,
      ),

      // ── Clean layout selection without Obx crashing the build engine ──
      home: authController.isLoggedIn ? const HomeScreen() : const LoginScreen(),

      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
    );
  }
}