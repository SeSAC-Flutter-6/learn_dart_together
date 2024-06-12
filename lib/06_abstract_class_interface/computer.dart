// 문제 1 의 회사에서, 형태가 없는 무형자산(IntangibleAsset) 도 관리하려고 생각하고 있다.
// 무형자산에는, 예를들어 특허권(Patent) 등이 있다.
// 무형자산도 유형자산도 자산(Asset)의 일종이다.
// 이것을 전제로 다음의 상속도의 가, 나, 다 부분의 클래스명을 생각 해 보시오.

//유형자산 (TangibleAsset) 은, 자산 (Asset) 의 일종이며, 형태가 있는 것 (Thing) 의 일종이기도 하다.
//이 정의에 맞도록 TangibleAsset 의 소스 코드를 수정하시오.
//이 때, TangibleAsset 에 필드나 메소드의 추가가 필요하다면, 적당히 추가하시오.

//자산
//구체적인 기능을 정의하지 않은 메서드가 필요한거 같은데 뭐가 있지.
abstract interface class Asset {
  String get id; //모든 자산은 가치를 가짐
}

// 자산인지 아닌지 따지지 말고, 형태가 있는 것 (Thing) 이면, 무게가 있다
// 그래서, double 형으로 무게(weight)를 얻을 수 있도록 getter/setter를 가지는 인터페이스 Thing 을 만드시오

abstract interface class Thing {
  //게터
  double get weight;

  //세터
  set weight(double value);
}

//유형자산이면서 Asset과 Thing을 interface에서 implements 한다
abstract class TangibleAsset implements Asset, Thing {
  String id;
  String name;
  String color;
  double _weight;
  int price;

  TangibleAsset(
    this.id,
    this.price,
    this.name,
    this.color,
    this._weight,
  );

  //게터 재정의
  @override
  double get weight => _weight;

  //세터 재정의
  @override
  set weight(double newValue) {
    _weight = newValue;
  }
}

//무형자산이면서 Asset을 interface에서 implements 한다
abstract class IntangibleAsset implements Asset {
  String id; //고유아이디

  IntangibleAsset(this.id);
}

//TangibleAsset를 상속받은 Book 클래스
class Book extends TangibleAsset {
  String isbn;

  Book(
    super.id,
    super.price,
    super.name,
    super.color,
    super._weight, {
    required this.isbn,
  });
}

//TangibleAsset를 상속받은 Computer 클래스
class Computer extends TangibleAsset {
  String makerName;

  Computer(
    super.id,
    super.price,
    super.name,
    super.color,
    super._weight, {
    required this.makerName,
  });

  //게터 재정의
  @override
  double get weight => _weight;

  //세터 재정의
  @override
  set weight(double newValue) {
    _weight = newValue;
  }
}

//특허권
class Patent extends IntangibleAsset {
  int patentYears; //특허기간

  Patent(
    super.id,
    this.patentYears,
  );
}

//상표권
class Copyrights extends IntangibleAsset {
  String copyrightOwner; //상표권자

  Copyrights(
    super.id,
    this.copyrightOwner,
  );
}
