import 'package:intl/intl.dart';

DateTime parsePublishedDate(String str) {
  int year = int.parse(str.substring(0, 4));
  int month = int.parse(str.substring(4, 6));
  int day = int.parse(str.substring(6, 8));
  return DateTime(year, month, day);
}

bool isValidatePublishedDate(String date) {
  RegExp regExp = RegExp(r'^\d{8}$');

  if (!regExp.hasMatch(date) || date.length != 8) {
    return false;
  }

  return true;
}