void main() {}

class Repository {
  final DataSource _dataSource;

  Repository(this._dataSource);
}

class DataSource {
  Future<String> getData() async {
    return "밀가루";
  }
}
