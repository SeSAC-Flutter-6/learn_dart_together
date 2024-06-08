import 'package:learn_dart_together/03_encapsulation/wand.dart';
import 'package:learn_dart_together/03_encapsulation/wizard.dart';
import 'package:test/test.dart';

void main() {
  late Wizard wizard;
  final int minNameLenth = 3;

  // test 후 다른 test에 영향을 끼칠 거 같으면 setUP을 사용하자.
  setUpAll(() {
    wizard = Wizard(name: '마법사');
  });

  group('constructor()', () {
    test('wand의 이름은 3글자 이상이어야 한다.', () {
      expect(() => Wizard(name: '냥뇽뇽냥'), returnsNormally);
      expect(wizard.name.length, greaterThanOrEqualTo(minNameLenth));
      expect(wizard.name, isNotNull);
      expect(() => Wizard(name: '뇽냥'), throwsException);
      expect(() => wizard.name = '냥뇽', throwsException);
    });

    // wizard의 mp가 정상일 때의 테스트 추가하면 좋을 듯
    // hp도 마찬가지

    test('wizard의 mp는 음수가 될 수 없다.', () {
      expect(() => wizard.mp = -1, throwsException);
      expect(() => Wizard(name: '마법사', mp: -1), throwsException);
    });

    test('wizard의 hp는 음수가 되면 0으로 고정된다.', () {
      wizard.hp = -1;
      expect(wizard.hp, 0);
    });

    test('wizard 생성 이후에 wand에 null을 설정할 수 없다.', () {
      Wizard wizard = Wizard(name: '마법사', wand: Wand(name: '지팡이', power: 10));
      expect(() => wizard.wand = null, throwsException);
    });
  });
}
