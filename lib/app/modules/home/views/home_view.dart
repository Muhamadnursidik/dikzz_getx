import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HomeView', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.toNamed('/counter'),
              child: Text('Go to counter'),
            ),
            // SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () => Get.toNamed('/form-pendaftaran'),
            //   child: Text('Go to Form'),
            // ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => Get.toNamed('/form-pendaftaran'),
              child: Icon(Icons.send),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.toNamed('/post'),
              child: Text('Go to Post'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.toNamed('/quran'),
              child: Text('Baca Al-Quran'),
            ),
          ],
        ),
      ),
    );
  }
}
