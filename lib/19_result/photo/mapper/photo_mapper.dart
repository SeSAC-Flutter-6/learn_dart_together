import 'package:learn_dart_together/19_result/photo/dto/photo_dto.dart';
import 'package:learn_dart_together/19_result/photo/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      tags: (tags ?? '').split(','),
      imageUrl: largeImageUrl ?? '',
    );
  }
}
