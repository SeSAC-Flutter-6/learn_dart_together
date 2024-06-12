class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

/*
이런 클래스가 선언되어 있다.
다음 물음에 답하시오

X obj = A(); 로 A인스턴스를 생성한 후, 변수 obj에서 호출할 수 있는 메소드를 a(), b(), c() 중에 골라보시오
-> a, b, c -> a만 가능
Y y1 = A();
Y y2 = B(); 로 A와 B의 인스턴스를 생성한 후
y1.a();
-> Aa
y2.a(); 를 실행했을 때에 화면에 표시되는 내용을 말하시오.
-> Ba
*/

/*
문제 2 에서 이용한 A클래스나 B클래스의 인스턴스를 각각 1개씩 생성하여, List 에 차례로 담는다.
그 후에 List 의 요소를 차례대로 꺼내 각각의 인스턴스의 b() 메소드를 호출 하여야 한다. 이상을 전제로 다음 물음에 답하시오.
1. List 변수의 타입으로 무엇을 사용하여야 하는가
-> A와 B가 모두 부모를 갖는 상위 인터페이스나 클래스
2. 위에서 설명하고 있는 프로그램을 작성하시오
 */
void main() {
  // 연습문제 2
  print('연습문제 2');
  X obj = A();
  obj.a();

  Y y1 = A();
  Y y2 = B();
  y1.a();
  y2.a();

  // 연습문제 3
  print('연습문제 3');
  A a = A();
  B b = B();
  List<Y> list = [a, b];
  list.forEach((it) => it.b());
}
