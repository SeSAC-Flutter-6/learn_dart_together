import 'package:learn_dart_together/21_dto/user/data_source/mock_user_data_source.dart';
import 'package:learn_dart_together/21_dto/user/dto/user_dto.dart';
import 'package:learn_dart_together/21_dto/user/mapper/user_mapper.dart';
import 'package:learn_dart_together/21_dto/user/repository/user_repository.dart';
import 'package:learn_dart_together/21_dto/user/repository/user_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  final data = [
    {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": null, "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    },
    {
      "id": 2,
      "name": "Ervin Howell",
      "username": "Antonette",
      "email": "Shanna@melissa.tv",
      "address": {
        "street": "Victor Plains",
        "suite": "Suite 879",
        "city": "Wisokyburgh",
        "zipcode": "90566-7771",
        "geo": {"lat": "-43.9509", "lng": "-34.4618"}
      },
      "phone": "010-692-6593 x09125",
      "website": "anastasia.net",
      "company": {
        "name": "Deckow-Crist",
        "catchPhrase": "Proactive didactic contingency",
        "bs": "synergize scalable supply-chains"
      }
    }
  ];
  final UserRepository userRepository =
      UserRepositoryImpl(MockUserDataSource());
  test('getUsers()를 실행하면 모든 유저 객체를 리스트로 리턴함', () async {
    final resultData = await userRepository.getUsers();
    final testData =
        data.map((e) => UserDto.fromJson(e)).map((e) => e.toUser()).toList();
    expect(resultData, testData);
  });
}
