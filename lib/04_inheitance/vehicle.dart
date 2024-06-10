// 탈 것

class Vehicle {
  // 속성, 프로퍼티
  // Vehicle 클래스를 만들고 maker, model 및 year와 같은 속성을 포함합니다.
  String maker;
  String model;
  int year;

  Vehicle(
    this.maker,
    this.model,
    this.year,
  );

  void horn() {
    print('기본적인 클락션');
  }
}

// Car, Truck 및 Motorcycle와 같은 Vehicle 클래스의 하위 클래스를 만듭니다.
// 각 하위 클래스에 고유한 속성 및 메서드를 추가합니다.
class Car extends Vehicle {
  int numberOfSeats; //좌석 갯수

  Car(
    super.maker,
    super.model,
    super.year,
    this.numberOfSeats,
  );

  //오버라이드 메서드
  @override
  void horn() {
    print('$model은 승용차라 기본 클락션보다 더 좋습니다.');
  }
}

class Truck extends Vehicle {
  double loadCapacity; //적재용량
  bool hasEightTires;  //8개 타이어

  Truck(
    super.maker,
    super.model,
    super.year,
    this.loadCapacity,
    this.hasEightTires,
  );

  //오버라이드 메서드
  @override
  void horn() {
    print('$model은 아주 큰 트럭이라 클락션 소리가 가장 큽니다.');
  }

  void displayTireInfo() {
    if (hasEightTires) {
      print('$model은 8개의 타이어를 가지고 있습니다.');
    } else {
      print('$model은 8개의 타이어를 가지고 있지 않습니다.');
    }
  }
}

// 각 하위 클래스에 고유한 속성 및 메서드를 추가합니다.
class Motorcycle extends Vehicle {
  bool hasSideCar;//측차

  Motorcycle(
    super.maker,
    super.model,
    super.year,
    this.hasSideCar,
  );

  void handAccel() {
    print('손으로 돌려서 속도 증가');
  }

  void helmet() {
    print('모터사이클 탑승시에 헬멧 체크 필수');
  }

  //오버라이드 메서드
  @override
  void horn() {
    print('$model은 가장 작은 이동수단이라 소리가 아주 귀엽습니다.');
  }
}