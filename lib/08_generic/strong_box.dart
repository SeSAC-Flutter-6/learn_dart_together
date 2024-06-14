class StrongBox<T> {
  final KeyType keyType;
  T? _storedItem;
  int _useCount = 0;

  StrongBox({required this.keyType, T? item}) : _storedItem = item;

  int get useCount => _useCount;

  T? get() {
    _useCount++;
    if (_useCount > keyType.maxAttempts) {
      print('금고 횟수 초과');
      return null;
    }
    return _storedItem;
  }

  void put(T item) {
    _storedItem = item;
  }
}

enum KeyType {
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int maxAttempts;

  const KeyType(this.maxAttempts);
}
