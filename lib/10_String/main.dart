import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  String s1 = 'aaa';
  String s2 = 'aaa';
  String result = ''; //new

  final stopWatch = Stopwatch();
  stopWatch.start();
  // print(result.hashCode);
  for (var i = 0; i < 10000; i++) {
    result += '$i'; //new 인스턴스 생성이 매번 발생함. 수정되는 것이 아니라 할당을 다시 함.
    // print(result.hashCode); // result라는 변수명만 계속 다음 인스턴스로 이동됨
  } // 매칭 안된 나머지 할당 안된 스트링은 가비지 컬렉터가 메모리를 청소하러 돌아다님 (garbage collection) : 이것 자체도 비용이 발생하는 부분. 많으면 성능에 악영향을 줄 수있음
  stopWatch.stop();
  print(stopWatch.elapsed);

  final sb = StringBuffer('');
  for (var i = 0; i < 3; i++) {
    sb.write('$i');
  }

  Hero hero = Hero(name: 'name', hp: 100);
  Hero hero2 = Hero(name: 'name', hp: 100);

  print(identical(hero, hero2));
  print(s1.hashCode == s2.hashCode);
  print(identical(s1, s2));
}
