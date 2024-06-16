enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

class StrongBox<T> {
  //열쇠의 종류를 나타내는 필드 변수
  T? _gold;
  final KeyType _keyType;
  int _count = 0; //열쇠 시도 횟수
  int _maxCount = 0; //최대 시도 횟수

//열쇠의 종류를 받는 생성자
  StrongBox({
    required KeyType keyType,
  }) : _keyType = keyType;

  void put(T gold) {
    _gold = gold;
  }

  T? get() {
    _count++;
    switch (_keyType) {
      case KeyType.padlock:
        _maxCount = 1024;
        if (_count >= _maxCount) {
          return _gold;
        } else {
          return null;
        }

      case KeyType.button:
        _maxCount = 10000;
        if (_count >= _maxCount) {
          return _gold;
        } else {
          return null;
        }

      case KeyType.dial:
        _maxCount = 30000;
        if (_count >= _maxCount) {
          return _gold;
        } else {
          return null;
        }

      case KeyType.finger:
        _maxCount = 1000000;
        if (_count >= _maxCount) {
          return _gold;
        } else {
          return null;
        }
    }
  }
}
