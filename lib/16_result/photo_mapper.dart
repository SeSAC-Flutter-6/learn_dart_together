
import 'package:learn_dart_together/16_result/photo_dto.dart';

import 'photo.dart';

extension PhotoMapper on PhotoDTO {
  Photo toPhoto() { 
    return Photo(
        tags: tags?.split(", ").map((s) => s.trim()).toList() ?? [],
        imageUrl: largeImageURL ?? '',
    );
  }
}