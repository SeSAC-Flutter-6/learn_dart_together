import 'package:learn_dart_together/21_design/core/result.dart';
import 'package:learn_dart_together/21_design/data/model/gender.dart';
import 'package:learn_dart_together/21_design/data/model/user.dart';

import 'package:learn_dart_together/21_design/data/repository/user_repository_impl.dart';

import '../core/network_error.dart';

void main() async {
  final userRepository = UserRepositoryImpl();

  final result = await userRepository.fetchReadUsers();

  switch (result) {
    case Success<List<User>, NetworkError>():
      for (int i = 0; i < result.data.length; i++) {
        print('유저ID : ${result.data[i].id}');
        print('이름 : ${result.data[i].name}');
        print('주소 : ${result.data[i].address}');
        print('성별 : ${(result.data[i].gender == Gender.male) ? '남자' : '여자'}');
      }
      for (User user in result.data) {
        print('유저ID : ${user.id}');
        print('이름 : ${user.name}');
        print('주소 : ${user.address}');
        print('성별 : ${user.gender}');
      }

    case Error<List<User>, NetworkError>():
      {
        switch (result.error) {
          case NetworkError.requestTimeout:
            print('TimeOut');
          case NetworkError.unknown:
            print('알 수 없는 네트워크 에러');
        }
      }
  }
}
