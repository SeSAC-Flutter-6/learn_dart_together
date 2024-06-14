import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  String s1 = 'aaa';
  String s2 = 'aaa';

  // print(s1.hashCode == s2.hashCode);
  print(identical(s1, s2)); // true

  Hero hero1 = Hero(name: 'name', hp: 100);
  Hero hero2 = Hero(name: 'name', hp: 100);
  // print(identical(hero1, hero2)); // false

  // String은 불변
  final stopWatch = Stopwatch();
  stopWatch.start();
  String result = ''; // new
  for (var i = 0; i < 100000; i++) {
    result += '$i'; // new
  }
  stopWatch.stop();
  print(stopWatch.elapsedMilliseconds);

  // final stopWatch = Stopwatch();
  stopWatch.start();
  final sb = StringBuffer('');
  for (var i = 0; i < 10000000; i++) {
    sb.write('$i');
  }
  stopWatch.stop();
  print(stopWatch.elapsed);
}