import 'package:learn_dart_together/06_polymorphism/y.dart';

class B extends Y {
   @override
   void a() {
     print('Ba');
   }

   @override
   void b() {
     print('Bb');
   }

   void c() {
     print('Bc');
   }
 }