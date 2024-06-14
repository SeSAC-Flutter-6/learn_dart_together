import 'dart:math';

class StrongBox<E> {
  E? _valuables;
  final KeyType key;
  late int _count;

  E? get valuables => _valuables;
  int get count => _count;

  StrongBox({
    required E? valuables,
    required this.key,
  }) : _valuables = valuables {
    switch (key) {
      case KeyType.padlock:
        _count = 1024;
      case KeyType.button:
        _count = 10000;
      case KeyType.dial:
        _count = 30000;
      case KeyType.finger:
        _count = 1000000;
      case KeyType.test:
        _count = 3;
    }
  }

  void put(E valuables) {
    if (_valuables != null) {
      throw Exception("이미 물건을 보관중!");
    }
    _valuables = valuables;
  }

  E? get() {
    _count = max(_count - 1, 0);
    return _count == 0 ? _valuables : null;
  }
}

enum KeyType {
  padlock,
  button,
  dial,
  finger,
  test,
}

void main() {
  final a = StrongBox(valuables: 'gold', key: KeyType.button);
}
