// 기도하기(pray)라는 행동을 취하면, MP 회복
// 기도한 시간(초)에 따라서 0~2 포인트의 보정을 한 양이다. (3초 기도시 3~5포인트)
// 단 최대 MP 보다 더 회복은 불가능하다.
// Cleric 클래스에 pray() 메소드를 추가하기
// 이 메소드는 인수에 기도할 시간(초)를 지정할 수 있고, 리턴값은 '실제로 회복된 MP 양'을 반환

// 'given' 섹션: 테스트를 준비하는 부분입니다.
// 'when' 섹션: 테스트를 실행하는 부분입니다.
// 'then' 섹션: 결과를 검증하는 부분입니다.

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

  // test('pray 기도 테스트 - mp가 10으로 가득차 있는데, 이 경우에 어떻게 반환할지');
  // test('pray 기도 테스트 - mp가 초당 잘 증가하는 지 여부 확인하기', () {
  //   //given 테스트를 준비하는 부분
  //   final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);
  //   //when 테스트를 실행하는 부분
  //   cleric.pray(4);
  //   //then 결과를 검증하는 부분
  //   expect(cleric.hp, 50);
  //   expect(cleric.mp, 10);
  // });
}
