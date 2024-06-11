// Vehicle 클래스를 만들고 maker, model 및 year와 같은 속성을 포함합니다.
// Car, Truck 및 Motorcycle와 같은 Vehicle 클래스의 하위 클래스를 만듭니다.
// 각 하위 클래스에 고유한 속성 및 메서드를 추가합니다.
class Vehicle {
  String maker;
  String model;
  int year;

  Vehicle({required this.maker, required this.model, required this.year});
}
