import 'package:learn_dart_together/18_dto_mapper/practice_2/data_source/user_api.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_2/repository/user_repository_impl.dart';

void main() {
  UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(UserApi());
  print(userRepositoryImpl.getAllUsers());
}
