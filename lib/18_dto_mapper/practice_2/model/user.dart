class User {
  final String name;
  final String email;
  final double latitude;
  final double longitude;

  User({
    required this.name,
    required this.email,
    required this.latitude,
    required this.longitude,
  });

  User copyWith({
    String? name,
    String? email,
    double? latitude,
    double? longitude,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
