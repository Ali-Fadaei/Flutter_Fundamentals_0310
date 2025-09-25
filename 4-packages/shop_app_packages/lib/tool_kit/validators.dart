import 'package:persian_number_utility/persian_number_utility.dart';

abstract class Validators {
  //
  static bool isNotEmpty(String text) {
    return text.isNotEmpty;
  }

  static bool isValidMobileNumber(String text) {
    return text.isValidIranianMobileNumber();
  }

  static bool isValidNationalCode(String text) {
    return text.isValidIranianNationalCode();
  }

  static bool isValidBankCard(String text) {
    return text.isValidBankCardNumber();
  }
}
