import 'package:learn_dart_together/17_result/image_search/dto/photo_result_dto.dart';

import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id?.toInt() ?? 0,
      pageURL: pageURL ?? '',
      type: type ?? '',
      tags: tags ?? '',
      previewURL: previewURL ?? '',
      previewWidth: previewWidth?.toInt() ?? 0,
      previewHeight: previewHeight?.toInt() ?? 0,
      webformatURL: webformatURL ?? '',
      webformatWidth: webformatWidth?.toInt() ?? 0,
      webformatHeight: webformatHeight?.toInt() ?? 0,
      largeImageURL: largeImageURL ?? '',
      imageWidth: imageWidth?.toInt() ?? 0,
      imageHeight: imageHeight?.toInt() ?? 0,
      imageSize: imageSize?.toInt() ?? 0,
      views: views?.toInt() ?? 0,
      downloads: downloads?.toInt() ?? 0,
      collections: collections?.toInt() ?? 0,
      likes: likes?.toInt() ?? 0,
      comments: comments?.toInt() ?? 0,
      userId: userId?.toInt() ?? 0,
      user: user ?? '',
      userImageURL: userImageURL ?? '',
    );
  }
}
