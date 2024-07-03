import 'package:dio/dio.dart';
import 'package:learn_dart_together/20_dto_mapper/dto/user_dto.dart';

class UserApi {
  final Dio _dio;

  UserApi({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<UserDto>> getUser() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/users');

      if (response.statusCode == 200) {
        // JSON 데이터를 List<dynamic>으로 디코딩
        List<dynamic> jsonResponse = response.data;

        // List<dynamic>을 List<UserDto>로 변환
        List<UserDto> users =
            jsonResponse.map((json) => UserDto.fromJson(json)).toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
