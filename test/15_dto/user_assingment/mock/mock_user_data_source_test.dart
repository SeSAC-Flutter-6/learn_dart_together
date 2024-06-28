import 'package:collection/collection.dart';
import 'package:learn_dart_together/15_dto/user_assingment/dto/user_dto.dart';
import 'package:learn_dart_together/15_dto/user_assingment/mapper/user_mapper.dart';
import 'package:learn_dart_together/15_dto/user_assingment/mock/mock_user_data_source.dart';
import 'package:learn_dart_together/15_dto/user_assingment/model/user.dart';
import 'package:learn_dart_together/15_dto/user_assingment/repository_impl/user_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late MockUserDataSource mockUserDataSource;
  late UserRepositoryImpl userRepositoryImpl;
  final List<Map<String, dynamic>> testValue = [
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
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
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
    },
    {
      "id": 3,
      "name": "Clementine Bauch",
      "username": "Samantha",
      "email": "Nathan@yesenia.net",
      "address": {
        "street": "Douglas Extension",
        "suite": "Suite 847",
        "city": "McKenziehaven",
        "zipcode": "59590-4157",
        "geo": {"lat": "-68.6102", "lng": "-47.0653"}
      },
      "phone": "1-463-123-4447",
      "website": "ramiro.info",
      "company": {
        "name": "Romaguera-Jacobson",
        "catchPhrase": "Face to face bifurcated interface",
        "bs": "e-enable strategic applications"
      }
    },
  ];

  setUpAll(() {
    mockUserDataSource = MockUserDataSource();
    userRepositoryImpl = UserRepositoryImpl(mockUserDataSource);
  });

  test('getUsers() test', () async {
    final getUsersDto = await mockUserDataSource.getUsers();
    final users = getUsersDto.map((dto) => dto.toUser()).toList();

    final fakeResult =
        testValue.map((json) => UserDto.fromJson(json).toUser()).toList();

    expect(users, fakeResult);
  });

  test('getUser() test', () async {
    final target = 'Ervin Howell';
    final getUsersDto = await mockUserDataSource.getUser(target);
    final getUserName = getUsersDto?.toUser().name;

    final fakeResult = testValue
        .singleWhereOrNull((json) => UserDto.fromJson(json).name == target);

    expect(getUserName, fakeResult?['name']);
  });
}
