import 'package:learn_dart_together/cleric.dart';
import 'package:test/test.dart';

void main() {
  //maxHp = 50
  //maxMp = 10

  test('셀프에이드 MP 소모 테스트', () {
    // given(준비)
    final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);
    // when(실행)
    cleric.selfAid();
    // then(검증)
    expect(cleric.mp, equals(5));
  });

  test('셀프에이드 HP 회복 테스트', () {
    // given(준비)
    final Cleric cleric = Cleric(name: '성직자', hp: 10, mp: 10);
    // when(실행)
    cleric.selfAid();
    // then(검증)
    expect(cleric.hp, equals(50));
  });

  test('기도하기 MP 회복 테스트', () {
    // given(준비)
    final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 0);
    // when(실행)
    cleric.pray(1);
    // then(검증)
    expect(cleric.mp, inInclusiveRange(1, 3));
  });

  test('기도하기 MP 회복 테스트2', () {
    // given(준비)
    final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 0);
    // when(실행)
    cleric.pray(2);
    // then(검증)
    expect(cleric.mp, inInclusiveRange(2, 4));
  });
}
