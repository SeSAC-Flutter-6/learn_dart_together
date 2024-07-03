import '../dto/user_dto.dart';
import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      username: username ?? '',
      email: email ?? '없음',
      phone: phone ?? '없음',
      website: website ?? '없음',
    );
  }
}
