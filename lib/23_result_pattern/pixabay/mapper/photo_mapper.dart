import 'package:learn_dart_together/23_result_pattern/pixabay/dto/photo_dto.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/model/photo.dart';

extension PhotoMapper on Hits {
  Photo toPhoto() {
    return Photo(tags: tags??'', imageUrl: previewURL??'');
  }
}
