import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerSetting extends GetxController {
  late SharedPreferences prefs;
  RxString rxMusic = "".obs;
  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    bool? isMusicData = prefs.getBool("isMusic");
    rxMusic.value = "isMusicData: $isMusicData";
    super.onInit();
  }
}