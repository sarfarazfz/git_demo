import 'package:demo_one/commons/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerFirst extends GetxController {
  late SharedPreferences prefs;
  late TextEditingController textEditingControllerFull;
  late TextEditingController textEditingControllerCity;
  RxString rxFullName = "".obs;
  RxString rxCity = "".obs;
  RxString rxCallback = "".obs;
  @override
  void onInit() async {
    textEditingControllerFull = TextEditingController();
    textEditingControllerCity = TextEditingController();
    prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  void saveUserDetails() async {

    String fullName = textEditingControllerFull.text;
    if(fullName.isEmpty) {
      MySnackBar.errorSnack("Error", "Please enter your full name");
      return;
    }

    String city = textEditingControllerCity.text;
    if(city.isEmpty) {
      MySnackBar.errorSnack("Error", "Please enter your city");
      return;
    }

    rxFullName.value = fullName;
    rxCity.value = city;

    // persist data in local memory
    prefs.setString("name", fullName);
    prefs.setString("city", city);

    textEditingControllerFull.text = "";
    textEditingControllerCity.text = "";
  }

  void getSharedPrefData() {
    String? name = prefs.getString("name");
    String? city = prefs.getString("city");
    // MySnackBar.successSnack("Shared Preference", "name: $name; city: $city");
    textEditingControllerFull.text = name.toString();
    textEditingControllerCity.text = city.toString();
  }
}