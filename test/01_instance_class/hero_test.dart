import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('sleep()을 하면 hp가 100이 되어야 함', () {
    final hero = Hero(name: '홍길동', hp: 50);

    hero.sleep();

    expect(hero.hp, equals(100));
  });

  test('sleep()을 하면 hp가 100이 되어야 함 2', () {
    final hero = Hero(name: '홍길동', hp: 50);

    hero.sleep();

    expect(hero.hp, equals(100));
  });

  test('sleep()을 하면 hp가 100이 되어야 함 3', () {
    final hero = Hero(name: '홍길동', hp: 50);

    hero.sleep();

    expect(hero.hp, equals(100));
  });
}
