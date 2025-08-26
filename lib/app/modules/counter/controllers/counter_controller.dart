import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CounterController extends GetxController {
  RxInt hitung = 1.obs;

  void increment() {
    if (hitung < 100) {
      hitung++;
    } else {
      Get.snackbar(
        "stop",
        "Counter tidak boleh lebih dari 100",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void decrement() {
    if (hitung > 1) {
      hitung--;
    } else {
      Get.snackbar(
        "stop",
        "Counter tidak boleh kurang dari 0",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
