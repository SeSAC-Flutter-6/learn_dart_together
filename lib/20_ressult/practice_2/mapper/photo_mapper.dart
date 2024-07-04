import 'package:learn_dart_together/20_ressult/practice_2/dto/photo_result_dto.dart';
import 'package:learn_dart_together/20_ressult/practice_2/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      tags: tags!.split(',').map((tag) => tag.trim()).toList(),
      imageUrl: pageUrl!,
    );
  }
}
