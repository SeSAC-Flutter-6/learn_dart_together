import 'package:learn_dart_together/16_data_source/data_source/userlist_data_source.dart';

void main() {

}

class Repository {
  DataSource _dataSource;

  Repository(this._dataSource);


}

class MockDataSource implements DataSource {
  @override
  Future<List<User>> getUserData;

  @override
  async() {

  }

}