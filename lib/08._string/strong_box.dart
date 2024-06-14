import 'package:collection/collection.dart';

class StrongBox<T> {
  final KeyType _keyType;
  final int _maxAttempts;

  int get maxAttempts => _maxAttempts;
  int _attemps = 0;
  T? _item;

  void put(T item) {
    _item ??= item;
  }

  T? get() {
    if (_attemps < _maxAttempts) {
      _attemps++;
      return null;
    } else {
      T? temp = _item;
      _item = null;
      return temp;
    }
  }

  StrongBox(this._keyType) : _maxAttempts = _maxAttemptsForType(_keyType);

  static int _maxAttemptsForType(KeyType keyType) {
    switch (keyType) {
      case KeyType.padlock:
        return 1024;
      case KeyType.button:
        return 10000;
      case KeyType.dial:
        return 30000;
      case KeyType.finger:
        return 1000000;
    }
  }
}

enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

void main() {
  StrongBox<String> strongBox = StrongBox<String>(KeyType.dial);
  strongBox.put('gold');
  for (int i = 0; i < strongBox.maxAttempts; i++) {
    print(strongBox.get()); // null
  }
  // 사용 횟수가 허용 범위를 초과한 경우 열림
  print(strongBox.get()); // gold
}
