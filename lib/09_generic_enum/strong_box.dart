class StrongBox<E> {
  E? _item;
  KeyType _keyType;
  int _trialCount = 0;

  StrongBox({required KeyType keyType}) : _keyType = keyType {
    switch (keyType) {
      case KeyType.padlock:
        _trialCount = 1024;
      case KeyType.button:
        _trialCount = 10000;
      case KeyType.dial:
        _trialCount = 30000;
      case KeyType.finger:
        _trialCount = 1000000;
    }
  }

  void put(E item) {
    _item = item;
  }

  E? get() {
    if (_trialCount > 1) {
      _trialCount -= 1;
      return null;
    } else {
      _trialCount = 0;
      return _item;
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
  StrongBox<String> strongBox = StrongBox(keyType: KeyType.padlock);
  strongBox.put('present');
  for (int i = 0; i < 1024; i++) {
    print('${strongBox.get()},${strongBox._trialCount}번 남음');
  }
  // print(strongBox.trialCount);
}
