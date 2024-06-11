class Person {
  String _name;
  int _birthYear;

  static int nowYear = DateTime.now().year;

  String get name => _name;

  int get birthYear => _birthYear;

  Person(String name, int birthYear)
      : assert(birthYear <= nowYear),
        _name = name,
        _birthYear = birthYear;

  int get age {
    int age = nowYear - _birthYear;
    return age;
  }
}
