import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  String s1 = 'aaa';
  String s2 = 'aaa';
  //String은 한번 만들어 쓰면 stringPool에 담아놓고
  //재사용할때 다시 불러와서 쓰기때문에 메모리 주소도 같다

  print(s1.hashCode == s2.hashCode);

  Hero hero1 = Hero(name: 'name', hp: 100);
  Hero hero2 = Hero(name: 'name', hp: 100);

  //print(identical(hero1, hero2)); //false
  String result = '';

  final stopWatch = Stopwatch();
  stopWatch.start();
  final sb = StringBuffer();
  for (var i = 0; i < 3; i++) {
    result += '$i';

  }

  // final sb = StringBuffer('');
  // for (var i = 0; i < 3; i++) {
  //   result += '$i';
  //
  // }
  //final이 붙어있는 클래스는 상속금지!! = 불변
  //그런데 abstract final class String implements Comparable<String>, Pattern

  //인스턴스 계속 만들고 변수 화살표만 바뀐다 -> String


}