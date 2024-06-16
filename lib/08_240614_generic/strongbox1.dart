class StrongBox<T> {
  T? _data;

  // 인스턴스를 저장하는 메서드 put
  void put(T data) {
    _data = data;
  }

  // 인스턴스를 얻는 메서드 get
  T? get() {
    return _data;
  }
}
