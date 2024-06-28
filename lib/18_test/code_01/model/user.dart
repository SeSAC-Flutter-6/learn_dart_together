class User {
  //기본적인 User 객체 생성 - 동등성 비교와 fromJson, toJson 메서드 추가
  final int id;
  final String name;
  final String email;
  final DateTime createdAt;

//<editor-fold desc="Data Methods">
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          createdAt == other.createdAt);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'User{'
        ' id: $id,'
        ' name: $name,'
        ' email: $email,'
        ' createdAt: $createdAt,'
        '}';
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      createdAt: map['createdAt'] as DateTime,
    );
  }

//</editor-fold>
}
