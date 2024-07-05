
import 'package:learn_dart_together/20_result/practice_02/data/dto/photo_dto.dart';
import 'package:learn_dart_together/20_result/practice_02/data/model/photo_model.dart';

extension PhotoMapper on PhotoDto {
  PhotoModel toPhotoModel() {
    return PhotoModel(
      tags: tags ?? '',
      imageURL: largeImageURL ?? '',
    );
  }
}
