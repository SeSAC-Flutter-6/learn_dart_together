class StrongBox<T> {
  final KeyType _type;
  T? _thing;
  int _count;

  int get count => _count;

  void put(T thing) {
    _thing = thing;
  }

  T? get() {
    _count += 1;
    if (_type.count >= _count) return null;
    return _thing;
  }

  StrongBox(this._type, {count = 0}) : _count = count;
}

enum KeyType {
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int count;

  const KeyType(this.count);
}