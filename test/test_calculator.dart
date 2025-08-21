import 'package:demo_one/enums/enum_calculator.dart';
import 'package:demo_one/utils/calculations.dart';
import 'package:demo_one/utils/validations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("add", () {
    test("emptyString", () {
      // 1. empty number
      String? strIsValid1 = Validations.isValidNumber("");
      bool isActual1 = strIsValid1 == "Field should not be empty";
      expect(isActual1, isTrue);
    });

    test("alphaNumericString", () {
      // 2. alpha numeric string
      String? strIsValid2 = Validations.isValidNumber("3T");
      bool isActual2 = strIsValid2 == "Please enter valid number";
      expect(isActual2, isTrue);
    });

    test("calculation", () {
      Calculations calculations = Calculations();
      num result = calculations.calculateTwoNumbers(
        intFirst: 10,
        intSecond: 2,
        enumCalculator: EnumCalculator.add,
      );
      bool isActual3 = result == 12;
      expect(isActual3, isTrue);
    });
  });
}
