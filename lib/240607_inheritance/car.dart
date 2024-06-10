import 'package:learn_dart_together/240607_inheritance/vehicle.dart';

class Car extends Vehicle {
  int warranty;
  Car(super.maker, super.model, super.year, this.warranty);

  void move() {
    super.sound;
    print('차가 시동이 걸린 후 출발한다');
  }

  void horsePower() {
    print('100마력 이상으로 달립니다');
  }
}

//  @override
//   void move(){
//     super.move();
//     print("차가 지나갑니다");
//   }
