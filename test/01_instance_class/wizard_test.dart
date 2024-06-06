import 'package:learn_dart_together/01_instance_class/wizard.dart';
import 'package:test/test.dart';

void main() {
  test('Wizard 클래스의 생성자가 예외를 발생시키는지 테스트', () {
    // 이름이 null인 경우
    // expect(() => Wizard(null, fixedHp, fixedMp, Wand('test', 10.0)), throwsException);
    // 이름이 3글자 미만인 경우
    expect(() => Wizard('wi', 10, 10, Wand('test', 10.0)), throwsException);
    // MP가 음수인 경우
    expect(() => Wizard('wizard', 10, -1, Wand('test', 10.0)), throwsException);
  });

  test('Wizard 클래스의 MP setter가 예외를 발생시키는지 테스트', () {
    final wizard = Wizard('wizard', 10, 10, Wand('test', 10.0));
    // MP가 음수인 경우
    expect(() => wizard.mp = -1, throwsException);
  });

  test('Wizard 클래스의 HP setter가 음수를 0으로 대체하는지 테스트', () {
    final wizard = Wizard('wizard', -10, 10, Wand('test', 10.0));
    expect(wizard.hp, equals(0));
  });

  test('Wizard 클래스의 wand setter가 null을 허용하지 않는지 테스트', () {
    final wizard = Wizard('wizard', 10, 10, Wand('test', 10.0));
    // null을 넘기는 경우
    expect(() => wizard.wand = null, throwsException);
  });
}
