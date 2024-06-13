// 문제 1 의 회사에서, 형태가 없는 무형자산(IntangibleAsset) 도 관리하려고 생각하고 있다.
// 무형자산에는, 예를들어 특허권(Patent) 등이 있다.
// 무형자산도 유형자산도 자산(Asset)의 일종이다.
// 이것을 전제로 다음의 상속도의 가, 나, 다 부분의 클래스명을 생각 해 보시오.

//유형자산 (TangibleAsset) 은, 자산 (Asset) 의 일종이며, 형태가 있는 것 (Thing) 의 일종이기도 하다.
//이 정의에 맞도록 TangibleAsset 의 소스 코드를 수정하시오.
//이 때, TangibleAsset 에 필드나 메소드의 추가가 필요하다면, 적당히 추가하시오.

//자산
//구체적인 기능을 정의하지 않은 메서드가 필요한거 같은데 뭐가 있지.
abstract class Asset {
  String name;
  int price;
  String id; //모든 자산은 id를 가짐

  Asset({
    required this.name,
    required this.price,
    required this.id,
  });
}
