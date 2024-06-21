void main() {
  List<int> list = [1,2,3];

  List<int> sumList = list + [4,5];

  final Iterable<int> filteredList = list.where((e)) => e & 2 == 0);


}