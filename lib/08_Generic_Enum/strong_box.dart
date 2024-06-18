enum KeyType {
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int limit;
  const KeyType(this.limit);
}

final class StrongBox<T> {
  T? _data;
  KeyType _keyType;
  int _unlockHistory = 0;

  KeyType get keyType => _keyType;
  int get unlockHistory => _unlockHistory;

  StrongBox({
    required KeyType keyType,
  }) : _keyType = keyType;

  void put(T item) {
    _data = item;
  }

  T? get() {
    _unlockHistory++;
    if (_keyType.limit > _unlockHistory) {
      return null;
    } else {
      // 기존 아이템은 비우고 반환.
      final T? data = _data;
      _data = null;
			_unlockHistory = 0;
      return data;
    }
  }
}