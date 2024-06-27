class RentCar {
  var km = 0;

  static final RentCar _instance = RentCar._internal();

  // 객체 생성 전에 뭔가를 하고 생성해서 리턴하는 생성자
  factory RentCar.getInstance() {
    return RentCar._internal();
  }

  RentCar._internal(); // internal 그냥 기본생성자를 막기위한 이름임
}

void main() {
  final car1 = RentCar.getInstance();
  car1.km = 1000;

  final car2 = RentCar.getInstance(); // car1과 필드 공유
  car2.km = 2000;
}
