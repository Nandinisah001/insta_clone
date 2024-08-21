import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication/login_screen.dart';
import 'authentication/register_screen.dart';
import 'controllers/auth_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());

  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: const RegistrationScreen(),
      getPages: [
        GetPage(name: '/register', page: () => const RegistrationScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
      ],
    );
  }
}