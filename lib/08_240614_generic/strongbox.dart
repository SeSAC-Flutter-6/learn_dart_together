enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

class StrongBox<T> {
  T? _data;
  final KeyType keyType;
  int _getAttemptCount = 0;

  StrongBox(this.keyType);

  void put(T data) {
    _data = data;
  }

  T? get() {
    _getAttemptCount++;
    switch (keyType) {
      case KeyType.padlock:
        if (_getAttemptCount <= 1024) {
          return null;
        } else {
          return _data;
        }
      case KeyType.button:
        if (_getAttemptCount <= 10000) {
          return null;
        } else {
          return _data;
        }
      case KeyType.dial:
        if (_getAttemptCount <= 30000) {
          return null;
        } else {
          return _data;
        }
      case KeyType.finger:
        if (_getAttemptCount <= 1000000) {
          return null;
        } else {
          return _data;
        }
    }
  }
}
