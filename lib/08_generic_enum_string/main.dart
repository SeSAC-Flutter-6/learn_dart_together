import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  String s1 = 'mayo';
  String s2 = 'mayo';

  // String, int는 값 같으면 해쉬코드 같도록 이미 구현되어있음
  print(s1 == s2); // true
  print(s1.hashCode == s2.hashCode); // true
  print(identical(s1, s2)); // true 왜?
  // String의 경우 스트링풀이라는 곳이 있고 똑같은 것들은 하나로 저장됨

  Hero hero1 = Hero(name: 'eqq', hp: 10);
  Hero hero2 = Hero(name: 'eqq', hp: 10);
  print(identical(hero1, hero2)); // false 이게 일반적

  // String은 불변
  // final stopWatch = Stopwatch()..start();
  // String result = ''; // new
  // for (var i = 0; i < 10000; i++) {
  //   result += '$i'; // new
  // }
  // stopWatch.stop();
  // print(stopWatch.elapsedMilliseconds);

  // StringBuffer 썼을때
  final stopWatch = Stopwatch()..start();
  final sb = StringBuffer('');
  for (var i = 0; i < 10000; i++) {
    sb.write(i.toString());
  }
  stopWatch.stop();
  print(stopWatch.elapsedMilliseconds);
}
