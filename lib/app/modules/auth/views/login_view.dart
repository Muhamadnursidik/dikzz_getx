import 'package:dikzz_getx/app/modules/auth/controllers/auth_controller.dart';
import 'package:dikzz_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final AuthController c = Get.put(AuthController());

  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passC,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(
              () => c.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => c.login(emailC.text, passC.text),
                      child: Text("Login"),
                    ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
