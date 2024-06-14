import 'package:test/test.dart';
import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/inheritance/poison_slime.dart';

void main() {
  group('PoisonSlime', () {
    test('attack method with remains greater than 0', () {
      // 테스트에 사용될 hero 객체 생성
      Hero hero = Hero(name: '용사', hp: 100);
      // 테스트에 사용될 PoisonSlime 객체 생성
      PoisonSlime poisonSlime = PoisonSlime('A', hp: 100);
      int initialHp = hero.hp;
      int maxRemains = poisonSlime.remains;

      // remains 초기값 5로 5번의 독 공격이 가능
      for (int i = maxRemains; i > 0; i--) {
        poisonSlime.attack(hero);
        initialHp -= 10;
        // 공격 후 용사의 HP가 올바르게 감소되었는지 확인
        // 용사의 HP는 공격당 -10후의 값에 1/5씩 감소
        expect(hero.hp, equals(initialHp - initialHp ~/ 5));
        initialHp = hero.hp;
        // 남은 독 공격 횟수가 올바르게 감소되었는지 확인
        expect(poisonSlime.remains, equals(i - 1));
      }
    });

    test('attack method with remains equal to 0', () {
      // 테스트에 사용될 hero 객체 생성
      Hero hero = Hero(name: '용사', hp: 100);
      // remains가 0인 PoisonSlime 객체 생성
      PoisonSlime poisonSlime = PoisonSlime('A', hp: 100);
      poisonSlime.remains = 0; // remains를 0으로 설정하여 추가로 독 공격을 수행하지 않도록 설정

      poisonSlime.attack(hero);

      // 용사의 HP가 -10 외에 변하지 않았는지 확인
      expect(hero.hp, equals(90));

      // remains가 여전히 0인지 확인
      expect(poisonSlime.remains, equals(0));
    });
  });
}
