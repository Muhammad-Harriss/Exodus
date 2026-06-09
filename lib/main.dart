import 'package:exous/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor         : Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery    : true,
      locale                    : DevicePreview.locale(context),
      builder                   : DevicePreview.appBuilder,
      theme                     : ThemeData(
        scaffoldBackgroundColor: const Color(0xFF080818),
        brightness             : Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}