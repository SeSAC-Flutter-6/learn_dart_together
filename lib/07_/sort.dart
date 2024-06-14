import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';

void main() {
  final nums = [3, 2, 5, 1, 3];

  nums.sort((a, b) {
    if (a > b) {
      return -1;
    } else if (a < b) {
      return 1;
    }
    return 0;
  });

  print(nums);

  final names = ['c', 'a', 'b',];
  names.sort();
  print(names);


  final heroes = [
    Hero(name: '홍길동', hp: 100),
    Hero(name: '한석봉', hp: 50),
    Hero(name: '이순신', hp: 30),
  ];

  heroes.sort();
  print(heroes);

  final slimes = [
    Slime(100, 'b'),
    Slime(100, 'c'),
    Slime(100, 'a'),
  ];

  slimes.sort((a, b) => -a.suffix.compareTo(b.suffix));
  print(slimes.toString());

}