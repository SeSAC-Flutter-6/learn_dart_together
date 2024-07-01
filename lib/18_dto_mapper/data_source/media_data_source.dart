import 'package:learn_dart_together/18_dto_mapper/dto/media_dto.dart';

abstract interface class MediaDataSource {
  Future<List<MediaDto>> getMedias();

  Future<MediaDto?> getMedia(int id);
}
