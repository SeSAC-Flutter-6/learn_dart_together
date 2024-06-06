class Person {
  String _name;
  int _birthYear;

  static int nowYear = DateTime.now().year;

  String get name => _name;

  int get birthYear => _birthYear;

  Person(String name, int birthYear)
      : assert(birthYear <= nowYear,
            throw Exception('태어난 년도가 올바르지 않습니다. 현재 년도보다 클 수 없어요. 미래에서 오셨나요?')),
        _name = name,
        _birthYear = birthYear;

  int get age {
    int age = nowYear - _birthYear;
    return age;
  }
}
