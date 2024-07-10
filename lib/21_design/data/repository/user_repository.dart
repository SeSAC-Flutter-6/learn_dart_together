import 'package:learn_dart_together/21_design/data/model/user.dart';
import '../../core/network_error.dart';
import '../../core/result.dart';


abstract interface class UserRepository {
  Future<Result<User, NetworkError>> getUserCreate(User user);

  Future<Result<User, NetworkError>> getUserRead(int id);

  Future<Result<List<User>, NetworkError>> fetchReadUsers();

  Future<Result<User, NetworkError>> getUserUpdate(User user);

  Future<Result<User, NetworkError>> getUserDelete(User user);
}
