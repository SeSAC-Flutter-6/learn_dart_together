import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('selfAid 테스트 해보기-hp가 부족한 상태임', () {
    //given :테스트를 준비하는부분
    final Cleric cleric = Cleric(name: '성직자', hp: 20, mp: 10);
    //when: 테스트를 실행하는 부분
    cleric.selfAid();
    //then: 결과를 검증하는 부분
    expect(cleric.hp, 50);
    expect(cleric.mp, 5);
  });

  test('selfAid 테스트 해보기2 - hp가 가득찬 상태임', () {
    //given 테스트를 준비하는 부분
    final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);

    //when 테스트를 실행하는 부분
    cleric.selfAid();
    //then: 결과를 검증하는 부분
    expect(cleric.hp, 50);
    expect(cleric.mp, 10);
  });

  test('pray 기도 테스트 - mp가 초당 잘 증가하는 지 여부 확인하기', () {
    //given 테스트를 준비하는 부분
    final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 7);
    //when 테스트를 실행하는 부분
    cleric.pray(4);
    //then 결과를 검증하는 부분
    expect(cleric.hp, 50);
    expect(cleric.mp, 10);
  });
}
