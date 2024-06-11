class Person {
  final String name;
  final int birthYear;
  late final int _age;

  int get age => _age;

  Person({required this.name, required this.birthYear})
      : _age = getAge(birthYear);

  static int getAge(int birthYear) {
    final currentYear = DateTime.now().year;
    return currentYear - birthYear;
  }
}
