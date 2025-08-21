import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../commons/my_snack_bar.dart';

class ControllerEditProfile extends GetxController {
  late TextEditingController textEditingControllerFull;
  late TextEditingController textEditingControllerCity;
  RxString strFullName = "".obs;
  RxString strCity = "".obs;
  late SharedPreferences prefs;

  @override
  void onInit() async {
    textEditingControllerFull = TextEditingController();
    textEditingControllerCity = TextEditingController();
    prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  void saveUserData() {
    String fullName = textEditingControllerFull.text.trim();
    // fullName.length == 0 ~> fullName.isEmpty
    if(fullName.isEmpty) {
      MySnackBar.errorSnack("Error", "Full name should not be empty");
      return;
    }

    String city = textEditingControllerCity.text;
    if(city.isEmpty) {
      MySnackBar.errorSnack("Error", "City should not be empty");
      return;
    }

    strFullName.value = fullName;
    strCity.value = city;

    textEditingControllerFull.text = "";
    textEditingControllerCity.text = "";

    prefs.setBool("isProfile", true);
  }
}