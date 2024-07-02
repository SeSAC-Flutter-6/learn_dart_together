class DateTimeUtil {
  //date문자열을 DateTime으로 파싱. 값이 없을땐 에포크타임으로 설정.
  static DateTime parseDateTime([String? dateStr]) {
    if (dateStr == null || dateStr.isEmpty) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    try {
      return DateTime.parse(dateStr);
    } catch (e) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }
}
