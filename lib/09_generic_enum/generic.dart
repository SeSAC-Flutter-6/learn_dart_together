class StrongBox<E> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  E? get() {
    return _data;
  }
}

void main() {
  StrongBox<String> strongBox = StrongBox();
  StrongBox<int> strongBox1 = StrongBox();
  strongBox.put('present');
  strongBox1.put(2);

  String string = 'name';
  string.toUpperCase();
}
