import '../01_instance_class/hero.dart';

void main() {
  Hero.money = 200;

  // 2
  // Hero hero = Hero(name: '홍길동', hp: 100);
  // hero.name = 'a';
  // print(hero.name);

  // hero.name = '';

  List<int> nums = [1, 2, 3];

  Iterator<int> iterators = nums.iterator;

  bool hasNext = iterators.moveNext();
  print(hasNext);
  print(iterators.current);

  hasNext = iterators.moveNext();
  print(hasNext);
  print(iterators.current);

  hasNext = iterators.moveNext();
  print(hasNext);
  print(iterators.current);

  hasNext = iterators.moveNext();
  print(hasNext);
  print(iterators.current);

}
