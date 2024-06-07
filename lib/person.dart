class Person {
  final String name;
  final int birthYear;
  final int nowYear = DateTime.now().year;

  int get age => nowYear - birthYear;

  Person({required this.name, required this.birthYear}){
   if(birthYear > nowYear) throw Exception('birthYear 년도가 nowYear 보다 큽니다.');
  }
}
