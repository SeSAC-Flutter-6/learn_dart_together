void main() {
  final repository = Repository(MockDataSource());


}

class Repository {
  DataSource _dataSource;

  Repository(this._dataSource);

  Future<void> makeToppoki() async {
    // 준비

    final data = await _dataSource.getData();

    // 물에 불리고
    // 고추장 풀고
  }
}

class MockDataSource implements DataSource {
  @override
  Future<String> getData() async {
    return "쌀가루";
  }
}

class DataSource {
  Future<String> getData() async {
    return "밀가루";
  }
}