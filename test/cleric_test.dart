import 'package:learn_dart_together/cleric.dart';
import 'package:test/test.dart';

void main() {
  //maxHp = 50
  //maxMp = 10

  //리뷰
  //exception 상황 추가 하면 좋음
  //테스트 내용 더 상세하게 적기 ex(어떤 상태에서 어떻게 했는데 어떻게 됬다)
  //'테스트2' 보다는 더 상세하게 내용쓰기
  //group 키워드
  //expect에 list로 값 넣어서 여러 값 한번에 비교 가능
  //setUp, setUpAll 초기화 필요할때
  //throwsException 익셉션이 발생테스트(발생했다) ex) expect(() => cleric.pray(praySeconds: praySeconds), throwsException);

  test('셀프에이드 MP 소모 테스트(mp가 10일 때, selfAid()를 호출하면 mp는 5가 되어야한다.', () {
    // given(준비)
    final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);
    // when(실행)
    cleric.selfAid();
    // then(검증)
    expect(cleric.mp, equals(5));
  });

  test('셀프에이드 HP 회복 테스트(hp가 10일 때, selfAid()를 호출하면 hp는 maxHp값인 50이 되어야 한다)', () {
    // given(준비)
    final Cleric cleric = Cleric(name: '성직자', hp: 10, mp: 10);
    // when(실행)
    cleric.selfAid();
    // then(검증)
    expect(cleric.hp, equals(50));
  });

  test('기도하기 MP 회복 테스트(mp가 0일 때 pray(1)을 호출하면 mp는 1~3이 되어야 한다)', () {
    // given(준비)
    final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 0);
    // when(실행)
    cleric.pray(1);
    // then(검증)
    expect(cleric.mp, inInclusiveRange(1, 3));
  });


  test('기도하기 MP 회복 테스트(mp가 0일 때, pray(2)를 호출하면 mp는 2~4가 되어야 한다)', () {
    // given(준비)
    final Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 0);
    // when(실행)
    cleric.pray(2);
    // then(검증)
    expect(cleric.mp, inInclusiveRange(2, 4));
  });
}
