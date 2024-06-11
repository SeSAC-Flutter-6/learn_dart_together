// 자산(Asset) 추상 클래스
abstract interface class Asset {
  String get id; // 모든 자산은 ID를 가짐
  double get value; // 모든 자산은 값을 가짐
}

// 형태가 있는 것(Thing) 추상 클래스
abstract interface class Thing {
  double get weight;
  set weight(double value);
}

// 유형자산(TangibleAsset) 추상 클래스
abstract class TangibleAsset implements Asset, Thing {
  String id;
  double value;
  String name;
  double _weight;

  TangibleAsset(
      this.id,
      this.value,
      this.name,
      this._weight,
      );

  @override
  double get weight => _weight;

  @override
  set weight(double newValue) {
    _weight = newValue;
  }
}

// 무형자산(IntangibleAsset) 추상 클래스
abstract class IntangibleAsset implements Asset {
  String id;
  double value;
  String description;

  IntangibleAsset(
      this.id,
      this.value,
      this.description,
      );
}

// TangibleAsset을 상속받은 Book 클래스
class Book extends TangibleAsset {
  String isbn;

  Book(
      String id,
      double value,
      String name,
      double weight, {
        required this.isbn,
      }) : super(id, value, name, weight);
}

// TangibleAsset을 상속받은 Computer 클래스
class Computer extends TangibleAsset {
  String makerName;

  Computer(
      String id,
      double value,
      String name,
      double weight, {
        required this.makerName,
      }) : super(id, value, name, weight);
}

// IntangibleAsset을 상속받은 Patent 클래스
class Patent extends IntangibleAsset {
  int validityYears;

  Patent(
      String id,
      double value,
      String description,
      this.validityYears,
      ) : super(id, value, description);
}

// IntangibleAsset을 상속받은 Copyrights 클래스
class Copyrights extends IntangibleAsset {
  String author;

  Copyrights(
      String id,
      double value,
      String description,
      this.author,
      ) : super(id, value, description);
}
