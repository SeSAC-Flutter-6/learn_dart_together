void main() {
  List list = [1, 2, 3];
  final filterdlist = list.where((e) => e % 2 == 0).forEach(print);

  List sumList = list + [4, 5];
}
