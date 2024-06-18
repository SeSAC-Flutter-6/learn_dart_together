class Box<T> {
  final List<T> content;

  Box(this.content);

  List<T> getContent() => content;
}

void main() {
  final box1 = Box<int>([1, 2, 3]);
  final box2 = Box<String>(['a', 'b', 'c']);
  final age = 2;
  String a = 'H';
  a += 'i';
  print(a);
  print('하루는 내년에 ${age + 1}살');
}
