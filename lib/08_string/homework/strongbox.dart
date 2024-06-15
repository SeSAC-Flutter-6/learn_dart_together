/*
다음 조건을 만족하는 금고인 StrongBox 클래스를 정의하시오.
금고 클래스에 담는 인스턴스의 타입은 미정
금고에는 1개의 인스턴스를 담을 수 있음
put() 메서드로 인스턴스를 저장하고 get() 메서드로 인스턴스를 얻을 있음
get() 으로 얻을 때는 별도의 타입 캐스팅을 사용하지 않아도 됨

* */
class StrongBox<E> {
  E? _data;
  KeyType keyType;
  int _count = 0;

  StrongBox({required this.keyType}) {
    switch (keyType) {
      case KeyType.padlock:
        _count = 1024;
      case KeyType.button:
        _count = 10000;
      case KeyType.dial:
        _count = 30000;
      case KeyType.finger:
        _count = 1000000;
    }
  }

  void put(E data) {
    _data = data;
  }

  E? get() {
    if (_count == 0) {
      return _data;
    }
    _count -= 1;

    return null;
  }
}

enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

void main() {
  StrongBox box = StrongBox(keyType: KeyType.padlock);
  //print(box.get()); null
  //box.put('과일');
  //box.put('사과');
  //box.put(123); 됨
  //print(box.get()); //사과
}
