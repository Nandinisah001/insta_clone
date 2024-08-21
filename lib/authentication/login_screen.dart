import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_widget.dart';



class LoginScreen extends StatelessWidget with ValidationMixin {
  final AuthController authController = Get.find<AuthController>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("Login",style: TextStyle(
            fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80,right: 20,left: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Icon(Icons.person,color: Colors.blue.shade900,size: 150),
                const SizedBox(height: 40),
                _buildTextField(_emailController, 'Email', Icons.email, false),
                const SizedBox(height: 20),
                _buildTextField(_passwordController, 'Password', Icons.lock, true),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      authController.loginWithEmailAndPassword(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    } else {
                      Get.snackbar('Error', 'Please fill all fields.');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.blue.shade900, // Changed to blue
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Login', style: TextStyle(fontSize: 18,color: Colors.white)),
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(color: Colors.blue), // Changed to blue
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap =(){
                          Get.toNamed('/register');
                        },
                        text: 'Register',
                        style:  const TextStyle(
                          color: Colors.black, // Register text in black
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon, bool isPassword) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.blue.shade900), // Changed to blue
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      obscureText: isPassword,
      validator: isPassword ? validatePassword : validateEmail,
    );
  }
}