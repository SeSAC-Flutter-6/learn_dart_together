import 'package:learn_dart_together/21_design/core/result.dart';
import 'package:learn_dart_together/21_design/data/model/user.dart';
import 'package:learn_dart_together/21_design/data/repository/user_repository.dart';
import 'package:learn_dart_together/21_design/data/repository/user_repository_impl.dart';

void main() async {
  final userRepository = UserRepositoryImpl();

  final result = await userRepository.fetchReadUsers();

  switch (result) {
    case Success<List<User>, NetworkError>():
      print(result.data);
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
