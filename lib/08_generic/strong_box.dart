class StrongBox<T> {
  T? _storedItem;

  void put(T item) {
    _storedItem = item;
  }

  T? get() {
    return _storedItem;
  }
}
