import 'package:collection/collection.dart';
import 'package:learn_dart_together/21_dto/photo/data_source/mock_photo_data_source.dart';
import 'package:learn_dart_together/21_dto/photo/dto/photo_dto.dart';
import 'package:learn_dart_together/21_dto/photo/model/photo.dart';
import 'package:learn_dart_together/21_dto/photo/repository/photo_repository_impl.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
        id: int.parse((id ?? 0).toString()),
        type: Type.values.firstWhereOrNull(
                (e) => e.toString().split('.').last == type) ??
            Type.unknown,
        title: title ?? '',
        content: content ?? '',
        caption: caption ?? '',
        url: url ?? '',
        createdAt: DateTime.tryParse(created_at ?? '') ?? DateTime(1, 2, 3));
  }
}

void main() async {
  final data = await PhotoRepositoryImpl(MockPhotoDataSource()).getPhotos();
  print(data);
}
