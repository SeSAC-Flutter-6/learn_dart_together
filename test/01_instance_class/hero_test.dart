import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:test/test.dart';

void main() {
  test('sleep()을 하면 hp가 100이 되어야 함', () {
    //given
    final hero = Hero(name: '히어로', hp: 10);
    //when
    hero.sleep();
    //then
    expect(hero.hp, equals(100));
    expect(hero.hp, 100); // 두가지 방법
  });
}
