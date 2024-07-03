import 'package:collection/collection.dart';
import 'package:learn_dart_together/21_dto/photo/dto/photo_dto.dart';
import 'package:learn_dart_together/21_dto/photo/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
        id: int.parse((id ?? 0).toString()),
        type: Type.values.firstWhereOrNull((e) => e.toString() == type) ??
            Type.unknown,
        title: title ?? '',
        content: content ?? '',
        caption: caption ?? '',
        url: url ?? '',
        createdAt: DateTime.tryParse(created_at ?? '') ?? DateTime(1, 2, 3));
  }
}
