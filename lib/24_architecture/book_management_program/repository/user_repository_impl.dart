import 'package:collection/collection.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/core/result.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/user_data_source.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/error/enum.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/main.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/user.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  const UserRepositoryImpl({
    required UserDataSource userDataSource,
  }) : _userDataSource = userDataSource;

  @override
  Future<Result<User, ErrorType>> createUser({
    required String name,
    required String address,
    required String phoneNumber,
    required String birthday,
  }) async {
    final data = await getUsers();
    switch (data) {
      case Success<List<User>, ErrorType>():
        try {
          final user = User(
              id: data.data.sorted((a, b) => a.id.compareTo(b.id)).last.id + 1,
              registrationDate:
                  DateTime.now().toString().split(' ')[0].replaceAll('-', '/'),
              name: name,
              address: address,
              phoneNumber: phoneNumber,
              birthday: birthday);
          await _userDataSource.addUser(user);
          return Result.success(user);
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<List<User>, ErrorType>():
        return Result.error(ErrorType.readError);
    }
  }

  @override
  Future<Result<void, ErrorType>> deleteUser({required int id}) async {
    final data = await getUser(id: id);
    switch (data) {
      case Success<User, ErrorType>():
        try {
          deletedUser = data.data;
          return Result.success(await _userDataSource.deleteUser(data.data));
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<User, ErrorType>():
        return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<User, ErrorType>> getUser({required int id}) async {
    final data = await getUsers();
    switch (data) {
      case Success<List<User>, ErrorType>():
        try {
          return Result.success(data.data.firstWhere((e) => e.id == id));
        } catch (e) {
          return Result.error(ErrorType.noDataError);
        }
      case Error<List<User>, ErrorType>():
        return Result.error(ErrorType.readError);
    }
  }

  @override
  Future<Result<List<User>, ErrorType>> getUsers() async {
    try {
      final data = await _userDataSource.getUsers();
      return Result.success(data);
    } catch (e) {
      return Result.error(ErrorType.readError);
    }
  }

  @override
  Future<Result<void, ErrorType>> updateUser({
    required int id,
    String? name,
    String? address,
    String? phoneNumber,
    String? birthday,
  }) async {
    final data = await getUser(id: id);
    switch (data) {
      case Success<User, ErrorType>():
        try {
          return Result.success(
              await _userDataSource.updateUser(data.data.copyWith(
            name: name ?? data.data.name,
            address: address ?? data.data.address,
            phoneNumber: phoneNumber ?? data.data.phoneNumber,
            birthday: birthday ?? data.data.birthday,
          )));
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<User, ErrorType>():
        return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<void, ErrorType>> cancelDelete() async {
    if (deletedUser != null) {
      final result = await createUser(
          name: deletedUser!.name,
          address: deletedUser!.address,
          phoneNumber: deletedUser!.phoneNumber,
          birthday: deletedUser!.birthday);
      switch (result) {
        case Success<User, ErrorType>():
          try {
            return Result.success(deletedUser = null);
          } catch (e) {
            Result.error(ErrorType.failure);
          }
        case Error<User, ErrorType>():
          return Result.error(ErrorType.failure);
      }
    }
    return Result.error(ErrorType.noDataError);
  }
}
