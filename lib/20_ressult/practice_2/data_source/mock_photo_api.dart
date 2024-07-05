import 'dart:convert';

import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_data_source.dart';
import 'package:learn_dart_together/20_ressult/practice_2/dto/photo_result_dto.dart';

class MockPhotoApi implements PhotoDataSource {
  static const fakeJsonResponse = '''
    {
      "total": 6974,
      "totalHits": 500,
      "hits": [     
        {
          "id": 2719,
          "pageURL": "https://pixabay.com/videos/id-2719/",
          "type": "film",
          "tags": "dandelion, flower, yellow",
          "duration": 23,
          "videos": {
            "large": {
              "url": "https://cdn.pixabay.com/video/2016/04/05/2719-161687568_large.mp4",
              "width": 1920,
              "height": 1080,
              "size": 13392449,
              "thumbnail": "https://cdn.pixabay.com/video/2016/04/05/2719-161687568_large.jpg"
            },
            "medium": {
              "url": "https://cdn.pixabay.com/video/2016/04/05/2719-161687568_medium.mp4",
              "width": 1280,
              "height": 720,
              "size": 7770061,
              "thumbnail": "https://cdn.pixabay.com/video/2016/04/05/2719-161687568_medium.jpg"
            },
            "small": {
              "url": "https://cdn.pixabay.com/video/2016/04/05/2719-161687568_small.mp4",
              "width": 960,
              "height": 540,
              "size": 4940642,
              "thumbnail": "https://cdn.pixabay.com/video/2016/04/05/2719-161687568_small.jpg"
            },
            "tiny": {
              "url": "https://cdn.pixabay.com/video/2016/04/05/2719-161687568_tiny.mp4",
              "width": 640,
              "height": 360,
              "size": 1769296,
              "thumbnail": "https://cdn.pixabay.com/video/2016/04/05/2719-161687568_tiny.jpg"
            }
          },
          "views": 110950,
          "downloads": 52431,
          "likes": 469,
          "comments": 148,
          "user_id": 1981326,
          "user": "FMFA",
          "userImageURL": "https://cdn.pixabay.com/user/2016/05/06/18-47-35-699_250x250.png"
        }
      ]
    }
    ''';

  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    final List<PhotoDto> photoList =
        (jsonDecode(fakeJsonResponse)['hits'] as List)
            .map((e) => PhotoDto.fromJson(e))
            .toList();

    return List.unmodifiable(photoList);
  }
}
