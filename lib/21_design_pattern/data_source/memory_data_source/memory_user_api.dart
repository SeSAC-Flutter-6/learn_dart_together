import 'package:learn_dart_together/21_design_pattern/data_source/user_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/user.dart';
import 'package:learn_dart_together/21_design_pattern/utils/csv_utils.dart';

class MemoryUserApi implements UserDataSource {
  final String csvFilePath = './assets/users.csv';

  @override
  Future<List<User>> getUsers() async {
    final csvData = await readCsvFile(csvFilePath);
    return csvData.map((line) => UserCsvExtension.fromCsv(line)).toList();
  }

  @override
  Future<User> getUser(int id) async {
    List<User> users = await getUsers();
    return users.firstWhere((user) => user.id == id);
  }

  @override
  Future<User> createUser(User user) async {
    List<User> users = await getUsers();

    User newUser = User(
      id: users.isNotEmpty ? users.last.id! + 1 : 1,
      name: user.name,
      phone: user.phone,
      address: user.address,
      birthday: user.birthday,
      createdAt: DateTime.now(),
    );

    users.add(newUser);
    List<String> csvData = users.map((user) => user.toCsv()).toList();
    await writeCsvFile(csvFilePath, csvData);
    return newUser;
  }

  @override
  Future<User> deleteUser(int id) async {
    List<User> users = await getUsers();
    User userToDelete = users.firstWhere((user) => user.id == id);
    users.removeWhere((user) => user.id == id);

    await writeCsvFile(csvFilePath, users.map((user) => user.toCsv()).toList());
    return userToDelete;
  }

  @override
  Future<User> updateUser(User user) async {
    List<User> users = await getUsers();
    int index = users.indexWhere((u) => u.id == user.id);

    if (index == -1) {
      throw Exception('User not found');
    }

    User existingUser = users[index];

    User updatedUser = User(
      id: existingUser.id,
      name: user.name.isNotEmpty ? user.name : existingUser.name,
      phone: user.phone.isNotEmpty ? user.phone : existingUser.phone,
      address: user.address.isNotEmpty ? user.address : existingUser.address,
      birthday: user.birthday ?? existingUser.birthday,
      createdAt: user.createdAt ?? existingUser.createdAt,
    );

    users[index] = updatedUser;
    await writeCsvFile(csvFilePath, users.map((user) => user.toCsv()).toList());
    return updatedUser;
  }
}
