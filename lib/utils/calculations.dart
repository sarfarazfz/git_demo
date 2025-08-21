import '../enums/enum_calculator.dart';

class Calculations {
  num calculateTwoNumbers({
    required int intFirst,
    required int intSecond,
    required EnumCalculator enumCalculator,
  }) {
    switch (enumCalculator) {
      case EnumCalculator.add:
        {
          int result = intFirst + intSecond;
          return result;
        }
      case EnumCalculator.sub:
        {
          int result = intFirst - intSecond;
          return result;
        }
      case EnumCalculator.mul:
        {
          int result = intFirst * intSecond;
          return result;
        }
      default:
        {
          double result = intFirst / intSecond;
          return result;
        }
    }
  }
}
