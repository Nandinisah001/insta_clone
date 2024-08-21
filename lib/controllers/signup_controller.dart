

//  ****************this is right code but i did not use in insta clone.**********


// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:insta_clon/screens/home_screen.dart';
//
// class SignupController extends GetxController {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   var image = Rx<File?>(null);
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//
//
//
//
//    // File? image;
//
//   Future<void> register() async {
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       if (userCredential.user != null) {
//         Fluttertoast.showToast(msg: "Registered Successfully");
//         Get.to(() => const HomeScreen());
//       } else {
//         Fluttertoast.showToast(msg: "Something Went Wrong");
//       }
//     } catch (e) {
//       print(e);
//       Fluttertoast.showToast(msg: "Error: $e");
//     }
//   }
//
//   Future<void> pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     if (pickedFile != null) {
//       image.value = File(pickedFile.path);
//     } else {
//       Fluttertoast.showToast(msg: 'No image selected.');
//     }
//   }
//
//   void showPickerDialog() {
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Pick an image'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               leading: const Icon(Icons.camera_alt),
//               title: const Text('Camera'),
//               onTap: () {
//                 Get.back(); // Close the dialog
//                 pickImage(ImageSource.camera);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_library),
//               title: const Text('Gallery'),
//               onTap: () {
//                 Get.back(); // Close the dialog
//                 pickImage(ImageSource.gallery);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
