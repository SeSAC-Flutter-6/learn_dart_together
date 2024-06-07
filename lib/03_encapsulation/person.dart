class Person {
  final String name;
  final int birthYear;

  int get age {
    return DateTime.now().year - birthYear;
  }

  Person({
    required this.name,
    required this.birthYear,
  });
}
