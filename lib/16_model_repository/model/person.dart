class Person {
  final String name;
  final int age;

//<editor-fold desc="Data Methods">
  const Person({
    required this.name,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age);

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'Person{' + ' name: $name,' + ' age: $age,' + '}';
  }

  Person copyWith({
    String? name,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'age': this.age,
    };
  }

  factory Person.fromJson(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

//</editor-fold>
}

abstract interface class TodoRepository {}

class DataSource {}

class TodoRepositoryImpl implements TodoRepository {
  final DataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);
}

abstract interface class TodoDataSource {}

class MockTodoDataSource implements TodoDataSource {}


