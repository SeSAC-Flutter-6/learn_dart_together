import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  factory Album({
    required int id,
    required int userId,
    required String title,
    // @Default([]) required List<Todo> todos, //List는 앞에 @Defaul([]) 이 형식이 붙어야 한다.
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
