import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_dart_together/23_design_pattern/model/book.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum Gender {male, female}

@freezed
class User with _$User {

  factory User({
    required int id,
    required String name,
    required String address,
    required DateTime birth,
    required bool isMember,
    required DateTime createdAt,
    required List<Book> loanBooks,
    required Gender gender,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}