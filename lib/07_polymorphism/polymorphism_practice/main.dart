import 'package:learn_dart_together/07_polymorphism/polymorphism_practice/a.dart';
import 'package:learn_dart_together/07_polymorphism/polymorphism_practice/b.dart';
import 'package:learn_dart_together/07_polymorphism/polymorphism_practice/x.dart';
import 'package:learn_dart_together/07_polymorphism/polymorphism_practice/y.dart';

void main() {
  X obj = A();
  obj.a();

  Y y1 = A();
  Y y2 = B();

  y1.a(); //Aa
  y2.a(); //Ba

  Y a1 = A();
  Y b1 = B();
  List<Y> objects = [];
  objects.add(a1);
  objects.add(b1);
  for (Y y in objects) {
    y.b();
  }
}
