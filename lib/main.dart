import 'package:eco_earth/secrets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants/_01_routes.dart';
import 'firebase_options.dart';
import 'controllers/_02_settings_controller/_01_setting_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: ANON_KEY,
  );
  // Ensure SettingsController is initialized before running the app
  Get.put(SettingsController());
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController sc = Get.find(); // Get the controller instance

    return Obx(() => GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme().apply(
          bodyColor: sc.darkMode.value ? Colors.white : Colors.black,  // White text in dark mode
          displayColor: sc.darkMode.value ? Colors.white : Colors.black,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: sc.darkMode.value ? Brightness.dark : Brightness.light, // Dynamic Theme
        ),
        useMaterial3: true,
      ),
      initialRoute: landing_route,
      routes: routes,
    ));
  }
}
