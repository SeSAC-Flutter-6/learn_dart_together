import 'package:learn_dart_together/homework/photo/data/dto/photo_dto.dart';
import 'package:learn_dart_together/homework/photo/data/model/photo.dart';

extension PhotoMapper on PhotoResultDto {
  Photo toPhoto() {
    return Photo(
      tags: tags ?? '',
      imageUrl: largeImageURL ?? '',
    );
  }
}
