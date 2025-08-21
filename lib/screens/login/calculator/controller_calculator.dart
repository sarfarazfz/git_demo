import 'package:demo_one/enums/enum_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/my_snack_bar.dart';
import '../../../utils/calculations.dart';
import '../../../utils/validations.dart';

class ControllerCalculator extends GetxController {
  late TextEditingController textEditingControllerFirst;
  late TextEditingController textEditingControllerSecond;

  RxString strResult = "No result found".obs;

  @override
  void onInit() {
    textEditingControllerFirst = TextEditingController();
    textEditingControllerSecond = TextEditingController();

    super.onInit();
  }

  void calculateNumbers(EnumCalculator enumCalculator) {
    // validation ++
    String strFirst = textEditingControllerFirst.text.trim();
    String? isValidFirst = Validations.isValidNumber(strFirst);
    if (isValidFirst != null) {
      MySnackBar.errorSnack("Error", isValidFirst);
      return;
    }

    String strSecond = textEditingControllerSecond.text.trim();
    String? isValidSecond = Validations.isValidNumber(strSecond);
    if (isValidSecond != null) {
      MySnackBar.errorSnack("Error", isValidSecond);
      return;
    }
    // validation--

    int intFirst = int.parse(strFirst);
    int intSecond = int.parse(strSecond);

    Calculations calculations = Calculations();
    num result = calculations.calculateTwoNumbers(
      enumCalculator: enumCalculator,
      intFirst: intFirst,
      intSecond: intSecond
    );

    strResult.value = result.toString();
  }
}
