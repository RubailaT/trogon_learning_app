import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trogon_learning_app/app/routes/app_pages.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isOnboarded = prefs.getBool('ONBOARDED') ?? false;

  runApp(MyApp(isOnboarded: isOnboarded));
}

class MyApp extends StatelessWidget {
  final bool isOnboarded;

  const MyApp({super.key, required this.isOnboarded});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learnify',
      initialRoute: isOnboarded ? AppRoutes.main : AppRoutes.onboarding,
      getPages: AppPages.pages,
    );
  }
}
