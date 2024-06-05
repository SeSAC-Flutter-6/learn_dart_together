
class Person {
  // 이름과 출생년도는 수정될 수 없다.
  final String name;
  final int birthYear;

  static final now = DateTime.now();
  static final nowYear = now.year;

  // 나이는 올해년도에서 출생년도를 뺀 값을 리턴한다.
  int get age => nowYear - birthYear;

  // 이름과 출생년도를 생성자로부터 주입 받는다
  Person({
    required this.name,
    required this.birthYear
  }) {
    if (birthYear > nowYear) {
      throw Exception('출생년도는 현재 연도보다 이전이어야 합니다.');
    }
  }
}