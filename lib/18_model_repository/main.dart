class User {
  final String name;
  final int age;

  const User(this.name, this.age);
}

void main() {
  final user1 = const User('홍길동', 10);
  final user2 = const User('홍길동', 10);

  print(user1 == user2); //false
  print(user1.hashCode == user2.hashCode); //true

  //만약에 const를 붙이면 어떻게 될까? const User(this.name, this.age) //false로 나온다.

  //final이 아닌경우는, 수정이 불가능 하므로, 앞에 final을 지워주고 시작해야 된다.

  // 1. const User에 const만 붙인경우, 2. void 안, User 앞에 const 붙이기

  //identical을 붙여서도 테스트해보기(print(identical(user1,user2))
  //user1.hasCode, user2.hashCode도 비교해보기

  //@immutable을 붙이면, 불변을 강제하려고 붙였나보다... flutter에 있음, dart X

  //factory 키워드 factory constructor라고 있다.

  //필수 과제1
  //1. interface로 만들고, 4종 구현하고,

  //필수2
  //1. dataSource 안에다가, 기능을 다 때려넣고,
  //2. Comment랑, 이름을 추가로 받도록 하자

  //필수 3.
  //1. 다 주는 것,
  //2. top 10

  //필수 4.
  //completed된 것만 주기 -> where로 주면 될 것 같다.  5번도 동일하다.
  //5번은, userName으로 sorting하기, -> 위에서 10명
  //필수 6.
  //6번도 동일하게, Posts를 만들면 된다.
  //page하고 limit을 설정해서, 한 페이지당 몇개씩 하는 것으로 구현하고 -> paging쓰면 된다는데..무슨 이야기인지 모르겠다.

  //필수 7.
  //메모장 -> 다음 코드가 동작하도록 MemoRepository을 작성하시오. 새로운 메모가 작성이 되는 느낌으로 하면 되고
  //update memo하면은, contents를 바꿔치기 하기 -> update 되고,

  //delete id에 따라서, 지울 수 있도록 하기 -> create, get, update, delete에 해당하는 interface를..만들기 우선..
  //impl로 봐도 된다고 하시네...어떻게 하면 좋을 지 모르겠다.
}
