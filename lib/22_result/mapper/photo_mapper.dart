import 'package:learn_dart_together/22_result/dto/photo_dto.dart';
import 'package:learn_dart_together/22_result/model/photo.dart';

extension PhotoMapper on Hits {
  Photo hits() {
return Photo(
      tags: tags?.split(", ").map((s) => s.trim()).toList() ?? [],
      imageUrl: previewURL ?? '',
    );
  }
}

