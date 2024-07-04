import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../15_datasource/main.dart';

part 'album.freezed.dart';

part 'album.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    required int id,
    required int userId,
    required String title,
    @Default([]) List<Todo> todos,
  }) = _Album;

  factory Album.fromJson(Map<String, Object?> json) => _$AlbumFromJson(json);
}