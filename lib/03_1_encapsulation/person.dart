class Person {
  final String _name;
  final int _birthYear;

  Person({required String name, required int birthYear})
      : _name = name,
        _birthYear = birthYear {
    if (this.birthYear > DateTime.now().year) {
      throw Exception(
          '출생년도가 올해년도보다 미래일 수 없음 (출생년도 : $_birthYear, 올해년도 : ${DateTime.now().year})');
    }
  }

  String get name => _name;
  int get birthYear => _birthYear;
  int get age => DateTime.now().year - _birthYear;
}
