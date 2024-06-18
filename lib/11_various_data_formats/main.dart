//총무부 리더 ‘홍길동(41세)’의 인스턴스를 생성하고 직렬화하여 company.txt 파일에 쓰는 프로그램을 작성하시오.
//직렬화를 위해 위의 2개 클래스를 일부 수정해도 됩니다.

//data class 를 위한 4종도 추가하시오.
class Employee {
  String name;
  int age;

  Employee({
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is Employee &&
            name == other.name &&
            age == other.age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'Employee{name : $name, age : $age} ';
  }

  Employee copyWith({
    String? name,
    int? age,
  }) {
    return Employee(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}

class Department {
  String name;
  Employee leader;

  Department({
    required this.name,
    required this.leader,
  });

  @override
  bool operator ==(Object other) {
    identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is Department &&
            name == other.name &&
            leader == other.leader;
    return true;
  }

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;

  @override
  String toString() {
    return 'Department{name : $name, leader : $leader}';
  }

  Department copyWith({
    String? name,
    Employee? leader,
  }) {
    return Department(
      name: name ?? this.name,
      leader: leader ?? this.leader,
    );
  }
}

void main() {
  Employee employee = Employee(name: '홍길동', age: 41);
}
