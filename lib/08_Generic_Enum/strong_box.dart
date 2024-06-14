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
  KeyType keyType;
  int unlockHistory = 0;

  StrongBox({
    required this.keyType
  });

  void put(T item) {
    _data = item;
  }

  T? get() {
    unlockHistory++;
    if (keyType.limit > unlockHistory) {
      return null;
    } else {
      // 기존 아이템은 비우고 반환.
      final T? data = _data;
      _data = null;
      return data;
    }
  }
}