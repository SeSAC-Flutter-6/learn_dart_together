class User {
  final String username;
  final String email;
  final String phone;
  final String website;

  const User({
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          email == other.email &&
          phone == other.phone &&
          website == other.website);

  @override
  int get hashCode =>
      username.hashCode ^ email.hashCode ^ phone.hashCode ^ website.hashCode;

  @override
  String toString() {
    return 'User{username: $username, email: $email, phone: $phone, website: $website}';
  }

  User copyWith({
    num? id,
    String? username,
    String? email,
    String? phone,
    String? website,
  }) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
    );
  }
}
