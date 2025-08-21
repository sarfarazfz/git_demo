import 'package:demo_one/commons/my_snack_bar.dart';
import 'package:demo_one/services/service_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ControllerCreateUser extends GetxController {
  // {uid: 8, first_name: Bruce, last_name: Wayne, dob: 12 Jul 1942 (83)}
  final Map<String, dynamic>? userItem;
  ControllerCreateUser({required this.userItem});


  late TextEditingController textEditingControllerFirst;
  late TextEditingController textEditingControllerLast;
  Database db = Get.find();
  RxString rxDob = "Tap here to select DOB".obs;
  @override
  void onInit() async {
    textEditingControllerFirst = TextEditingController(text: userItem == null ? "" : userItem!['first_name']);
    textEditingControllerLast = TextEditingController(text: userItem == null ? "" : userItem!['last_name']);
    if(userItem != null) {
      rxDob.value = userItem!['dob'];
    }
    super.onInit();
  }

  void dobPicker(BuildContext context) async {
    // open date picker
    DateTime dateTimeCurrent = DateTime.now();
    int currentYear = dateTimeCurrent.year;
    debugPrint("currentYear: $currentYear");
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // previous data:
      lastDate:
          DateTime.now(), // DateTime.now() => wont allow user to select future date
    );

    debugPrint("pickedDate: $pickedDate");
    if (pickedDate != null) {
      // 2025-07-02 00:00:00.000 ~> 02 Jul 2025
      int dobYear = pickedDate.year;
      int intAge = currentYear - dobYear;
      final formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);

      //calculate age:
      var difference = dateTimeCurrent.difference(pickedDate);
      debugPrint(
        "inDays: ${difference.inDays}; inHours: ${difference.inHours}; inMinutes: ${difference.inMinutes}",
      );
      rxDob.value = "$formattedDate ($intAge)";
    } else {
      rxDob.value = "Tap here to select DOB";
    }
  }

  Future<bool?> createNewUser() async {
    String strFirst = textEditingControllerFirst.text.trim();
    if (strFirst.isEmpty) {
      MySnackBar.errorSnack("Error", "Please enter first name");
      return null;
    }

    String strLast = textEditingControllerLast.text.trim();
    if (strLast.isEmpty) {
      MySnackBar.errorSnack("Error", "Please enter last name");
      return null;
    }

    if (rxDob.value == "Tap here to select DOB") {
      MySnackBar.errorSnack("Error", "Please select DOB");
      return null;
    }

    try {
      String strQuery = "INSERT INTO user (first_name, last_name, dob) VALUES ('$strFirst','$strLast','${rxDob.value}')";
      if(userItem != null) {
        strQuery =  "UPDATE user SET first_name = '$strFirst', last_name = '$strLast', dob = '${rxDob.value}' WHERE uid = '${userItem?['uid']}'";
      }
      var result = await db.rawQuery(strQuery);
      debugPrint("strQuery: $strQuery; result: $result");
      Get.back(result: true);
      return true;
    } catch (e) {
      debugPrint("insert user error: $e");
      MySnackBar.errorSnack("Error", "Error $e");
      return false;
    }
  }
}
