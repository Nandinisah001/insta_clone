import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clon/controllers/auth_controller.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  var authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Setting"),
      ),
      body: const Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 40,left: 40,right: 40),
            ),
          ],
        ),
      ),
    );
  }
}
