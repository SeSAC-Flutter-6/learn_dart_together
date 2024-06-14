import '../01_instance_class/hero.dart';
import '../01_instance_class/slime.dart';

void main() {
  final nums = [3, 2, 5, 1, 3];

  nums.sort((a, b) {
    if (a > b) {
      return 1;
    } else if (a < b) {
      return -1;
    } // 반대로 하고 싶으면 조건을 거꾸로 뒤집으면 됨 a<b,
    return 0;
  });

  print(nums);

  // final(nums);

  final name =['c', 'a', 'b'];

  final heroes = [
  Hero(name: '홍길동', hp: 100),
  Hero(name: '한석봉', hp: 50),
  Hero(name: '이순신', hp: 50),
  ];
  print(heroes.sort);

  // final slimes = [
  //   Slime(100, 'b'),
  //   Slime(100, 'c'),
  //   Slime(100, 'a'),
  // ];
  //
  // slimes.sort((a, b) => a.suffic.comparero(b.suffix));// 오름차순 정렬
  // slimes.sort((a, b) => -a.suffic.comparero(b.suffix));// 내림차순 정렬
  // print(slimes);

  final slimes = [
    Slime('b', hp: 100),
    Slime('c', hp: 100),
    Slime('a', hp: 100),
  ];

  slimes.sort((a, b) => a.suffix.compareTo(b.suffix));// 오름차순 정렬
  slimes.sort((a, b) => -a.suffix.compareTo(b.suffix));// 내림차순 정렬
  print(slimes);
}