class User {
  final String name;
  final String eamil;
  final double latitude;
  final double londtitude;

//<editor-fold desc="Data Methods">
  User({
    required this.name,
    required this.eamil,
    required this.latitude,
    required this.londtitude,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          eamil == other.eamil &&
          latitude == other.latitude &&
          londtitude == other.londtitude);

  @override
  int get hashCode =>
      name.hashCode ^ eamil.hashCode ^ latitude.hashCode ^ londtitude.hashCode;

  @override
  String toString() {
    return 'User{ name: $name, eamil: $eamil, latitude: $latitude, londtitude: $londtitude,}';
  }

  User copyWith({
    String? name,
    String? eamil,
    double? latitude,
    double? londtitude,
  }) {
    return User(
      name: name ?? this.name,
      eamil: eamil ?? this.eamil,
      latitude: latitude ?? this.latitude,
      londtitude: londtitude ?? this.londtitude,
    );
  }

//</editor-fold>
}
