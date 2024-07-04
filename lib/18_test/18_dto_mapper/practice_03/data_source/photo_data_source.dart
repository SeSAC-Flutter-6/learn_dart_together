
import 'package:learn_dart_together/17_factory_singleton/model/photo_model.dart';
import 'package:learn_dart_together/18_test/18_dto_mapper/practice_03/dto/photo_dto.dart';
import 'package:learn_dart_together/data_source/data_source.dart';

class MockPhotoApi implements PhotoDataSource {
  final List<Map<String, dynamic>> _json = [
  {
  "id": 1,
  "type": "article",
  "title": "This is an article",
  "content": "This is the content of the article.",
  "created_at": "2020-01-01"
},
{
"id": 2,
"type": "image",
"url": "https://example.com/image.jpg",
"caption": "This is an image.",
"created_at": "2020-02-02"
},
    {
      "id": 1,
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01"
    },

];

  @override
  Future<List<Photo>> getPhotos(int albumId) {
    var json = _jsonList.firstWhereOrNull((json) =>
    json['id'] == id.toString());
    return json != null ? Media.fromJson(json) : null;
     }

     @override
Future<List<PhotoDto>> getMedias() async {
    return _jsonList.map((json) => MediaDto.fromJson(json)).toList();
     }
}