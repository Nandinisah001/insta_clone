// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controllers/auth_controller.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   var authController = Get.put(AuthController());
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 3)).then((value) => authController.checkUserLogin());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Padding(padding: EdgeInsets.only(top: 340,right: 40,left: 40),
//               child: Text("KriCent",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 28),),)
//           ],
//         ),
//       ),
//     );
//   }
// }
