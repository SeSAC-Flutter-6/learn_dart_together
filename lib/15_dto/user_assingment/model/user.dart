class User {
  final String name;
  final String email;
  final double latitude;
  final double londtitude;

//<editor-fold desc="Data Methods">
  User({
    required this.name,
    required this.email,
    required this.latitude,
    required this.londtitude,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          latitude == other.latitude &&
          londtitude == other.londtitude);

  @override
  int get hashCode =>
      name.hashCode ^ email.hashCode ^ latitude.hashCode ^ londtitude.hashCode;

  @override
  String toString() {
    return 'User{ name: $name, email: $email, latitude: $latitude, londtitude: $londtitude,}';
  }

  User copyWith({
    String? name,
    String? email,
    double? latitude,
    double? londtitude,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      londtitude: londtitude ?? this.londtitude,
    );
  }

//</editor-fold>
}
