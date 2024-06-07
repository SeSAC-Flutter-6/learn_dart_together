class Person {
  final String name;
  final int birthYear;
  int? _age;

  int? get age {
    _age = DateTime.now().year - birthYear;
    return _age;
  }

  Person({required this.name, required this.birthYear});
}
