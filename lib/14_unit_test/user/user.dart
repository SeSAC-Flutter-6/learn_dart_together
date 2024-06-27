class User {
  int id;
  String name;
  String email;
  DateTime createdAt;

//<editor-fold desc="Data Methods">
  User({
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
    return 'User{ id: $id, name: $name, email: $email, createdAt: $createdAt,}';
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['createdAt'] as DateTime,
    );
  }

//</editor-fold>
}