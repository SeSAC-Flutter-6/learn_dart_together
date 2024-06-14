import '../../hero.dart';
import '../../slime.dart';

void main() {
  final nums = [3, 2, 1, 0];

  nums.sort((a, b) {
    if (a > b) {
      return -1;
    } else if (a < b) {
      return 1;
    }
    return 0;
  });
  print(nums);

  final hereos = [
    Hero(name: '홍길동', hp: 100),
    Hero(name: '한석봉', hp: 50),
    Hero(name: '이순신', hp: 30),
  ];

  hereos.sort();
  print(hereos.toString());

  final slime = [
    Slime(100,'a'),
    Slime(100,'b'),
    Slime(100,'c'),
  ];
  print(slime.toString());


}
