import 'package:demo_one/utils/validations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("login", () {
    test("empty email", () {
      String? strEmptyEmail = Validations.isValidLoginData("", "");
      bool isActual = strEmptyEmail == "Please enter email address";
      expect(isActual, isTrue);
    });
    test("invalid email", () {
      String? strEmptyEmail = Validations.isValidLoginData("wert", "");
      bool isActual = strEmptyEmail == "Please enter valid email address";
      expect(isActual, isTrue);
    });
    test("empty pass", () {
      String? strEmptyEmail = Validations.isValidLoginData(
        "admin@gmail.com",
        "",
      );
      bool isActual = strEmptyEmail == "Please enter password address";
      expect(isActual, isTrue);
    });
    test("invalid pass", () {
      String? strEmptyEmail = Validations.isValidLoginData(
        "admin@gmail.com",
        "sadfg",
      );
      bool isActual = strEmptyEmail == "Please enter valid password address";
      expect(isActual, isTrue);
    });
    test("valid email pass", () {
      String? strEmptyEmail = Validations.isValidLoginData(
        "admin@gmail.com",
        "p@ssw0rd",
      );
      bool isActual = strEmptyEmail == null;
      expect(isActual, isTrue);
    });
  });
}
