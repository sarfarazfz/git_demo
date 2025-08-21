import 'package:demo_one/commons/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/validations.dart';
import '../activity_profile.dart';

class ControllerLogin extends GetxController {
  late SharedPreferences prefs;
  late TextEditingController textEditingControllerEmail;
  late TextEditingController textEditingControllerPassword;

  @override
  void onInit() async {
    textEditingControllerEmail = TextEditingController();
    textEditingControllerPassword = TextEditingController();
    prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  // access_modifier/specifier return_type method/function_name (parameters)
  // access_modifier => start method with _ e.g. _checkEmailAndPassword()

  void checkEmailAndPassword() {
    String email = textEditingControllerEmail.text;
    String password = textEditingControllerPassword.text;

    String? strLoginErrorMsg = Validations.isValidLoginData(email, password);
    if(strLoginErrorMsg != null) {
      MySnackBar.errorSnack("Error", strLoginErrorMsg);
      return;
    }

        if(email == "admin@gmail.com" && password == "p@ssw0rd") {
      prefs.setBool("isLogin", true);
      Get.offAll(ActivityProfile(
        strFullName: "",
        strCity: "",
      ));
    } else {
      MySnackBar.errorSnack("Error", "Please enter valid credentials");
    }
  }
}