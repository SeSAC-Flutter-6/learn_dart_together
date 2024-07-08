import 'package:learn_dart_together/21_architecture/book_management_program/core/result.dart';
import 'package:learn_dart_together/21_architecture/book_management_program/error/enum.dart';


import '../model/user.dart';

abstract interface class UserRepository {
  Future<Result<User, ErrorType>> createUser({
    required String name,
    required String address,
    required String phoneNumber,
    required String birthday,
  });

  Future<Result<List<User>, ErrorType>> getUsers();

  Future<Result<User, ErrorType>> getUser({required int id});

  Future<Result<void, ErrorType>> updateUser({
    required int id,
    String? name,
    String? address,
    String? phoneNumber,
    String? birthday,
  });

  Future<Result<void, ErrorType>> deleteUser({required int id});
  Future<Result<void, ErrorType>> cancelDelete();
}
