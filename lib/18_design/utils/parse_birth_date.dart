import 'package:intl/intl.dart';

DateTime parseBirthDate(String birthDateStr) {
  int year = int.parse(birthDateStr.substring(0, 4));
  int month = int.parse(birthDateStr.substring(4, 6));
  int day = int.parse(birthDateStr.substring(6, 8));
  return DateTime(year, month, day);
}

bool isValidateBrith(String birth) {
  RegExp regExp = RegExp(r'^\d{8}$');

  if (!regExp.hasMatch(birth) || birth.length != 8) {
    return false;
  }

  return true;
}

String formatDate(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime); // 날짜만 포맷하여 반환
}
