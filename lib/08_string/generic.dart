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
  final int _maxCount; //최대 시도 횟수

//열쇠의 종류를 받는 생성자
  StrongBox({
    required KeyType keyType,
  })  : _keyType = keyType,
        _maxCount = _setMaxCount(keyType);

  void put(T gold) {
    _gold = gold;
  }


  // 시도 횟수 증가 메서드
  void attempt() {
    _count++;
    if(_count > _maxCount) {
      throw Exception('최대 시도 횟수를 초과했습니다');
    }
  }

  //열쇠 종류에 따른 최대 시도 횟수 setting
  static int _setMaxCount(KeyType keyType) {
    switch (keyType) {
      case KeyType.padlock:
        {
          return 1024;
        }
      case KeyType.button:
        {
          return 10000;
        }
      case KeyType.dial:
        {
          return 30000;
        }
      case KeyType.finger:
        {
          return 1000000;
        }
      default:
        throw Exception('열쇠 유형을 확인해 주세요');
    }
  }

  //금고 내용물 반환 메서드
  T? get() {
    if (_count >= _maxCount) {
      return _gold;
    } else {
      return null; //잠금 해제 전 null 반환
    }
  }
}
