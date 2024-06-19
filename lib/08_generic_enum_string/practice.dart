class Box<T> {
  final List<T> content;

  Box(this.content);

  List<T> getContent() => content;
}

void main() {
  var box1 = Box<int>([1, 2, 3]);
  var box2 = Box<String>(['a', 'b', 'c']);
  final age = 2;

  String a = 'H';
  a += 'i';

  print(a);
  print('하루는 내년에 ${age + 1}살');

  final str = 'eqqmayo';
  print(str.lastIndexOf('q')); // 2

  var box3 = box2;
  box2 = Box<String>(['b', 'b', 'b']);

  print(box3.content);
}
