void main() {
  // final repository = Repository(DataSource()); //이렇게 하면 실데이터 테스트 하는 거지만
  final repository = Repository(MockDataSource()); //이렇게 하면 mock 데이터 테스트 할 수 있다
}

class MockDataSource implements DataSource {
  @override
  Future<String> getData() async {
    return "쌀가루";
  }
}

class Repository {
  DataSource _dataSource;

  Repository(this._dataSource);

  Future<void> makeToppoki() async {
    final data = await _dataSource.getData();
  }
}

class DataSource {
  Future<String> getData() async {
    return "밀가루";
  }
}
