import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Validations {
  /// email and password take as a input, validate the data,
  /// if data is valid then return the null value else return error string.
  static String? isValidLoginData(String email, String password) {
    if(email == "") {
      return "Please enter email address";
    }

    bool isValidEmail = GetUtils.isEmail(email);
    if(isValidEmail == false) {
      return "Please enter valid email address";
    }

    if(password == "") {
      return "Please enter password";
    }

    // todo: regex for password
    if(password.length < 8) {
      return "Please enter valid password address";
    }

    return null;
  }

  // how to use? Validations.isValidNumber("")
  /// if data is valid then return the null value else return error string.
  static String? isValidNumber(String strNumber) {
    if(strNumber == "") {
      return "Field should not be empty";
    }

    bool isNum = GetUtils.isNum(strNumber);
    if(isNum == false) {
      return "Please enter valid number";
    }

    return null;
  }


}