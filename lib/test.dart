// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Test {
  String name;
  int i;
  Test({
    required this.name,
    required this.i,
  });

  Test copyWith({
    String? name,
    int? i,
  }) {
    return Test(
      name: name ?? this.name,
      i: i ?? this.i,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'i': i,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      name: map['name'] as String,
      i: map['i'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) =>
      Test.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Test(name: $name, i: $i)';

  @override
  bool operator ==(covariant Test other) {
    if (identical(this, other)) return true;

    return other.name == name && other.i == i;
  }

  @override
  int get hashCode => name.hashCode ^ i.hashCode;
}
