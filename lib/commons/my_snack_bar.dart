    import 'package:flutter/material.dart';
    import 'package:get/get.dart';

    class MySnackBar {
      // how to use?
      // MySnackBar.errorSnack("", "");
      static void errorSnack(String title, String message) {
        Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }

      static void successSnack(String title, String message) {
        Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
      }

      static void warningSnack(String title, String message) {
        Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.yellow, colorText: Colors.black);
      }
    }