import 'package:learn_dart_together/20_dto_mapper/model/photo.dart';
import 'package:learn_dart_together/20_dto_mapper/enum/enum_photo.dart';
import 'package:learn_dart_together/20_dto_mapper/dto/photo_dto.dart';

extension PhotoDtoToPhoto on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id ?? 0,
      type: type ?? PhotoEnum.unknown,
      url: url ?? '',
      caption: caption ?? '',
      createdAt: createdAt ?? DateTime(0, 0, 0, 0, 0, 0),
    );
  }
}
