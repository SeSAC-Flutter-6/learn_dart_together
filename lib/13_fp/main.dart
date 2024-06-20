void main() {
  List<int> list = [1, 2, 3];
  final Iterable<int> result = list.where((e) => e % 2 == 0);
}
