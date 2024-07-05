import 'package:learn_dart_together/20_result/practice_02/dto/photo_dto.dart';
import 'package:learn_dart_together/20_result/practice_02/model/photo_model.dart';

extension PhotoMapper on PhotoDto {
  PhotoModel toPhotoModel() {
    return PhotoModel(
      tags: tags ?? '',
      imageURL: largeImageURL ?? '',
    );
  }
}
