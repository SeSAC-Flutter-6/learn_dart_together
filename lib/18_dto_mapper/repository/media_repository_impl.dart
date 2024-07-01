import 'package:learn_dart_together/18_dto_mapper/data_source/media_data_source.dart';
import 'package:learn_dart_together/18_dto_mapper/dto/media_dto.dart';
import 'package:learn_dart_together/18_dto_mapper/mapper/media_mapper.dart';
import 'package:learn_dart_together/18_dto_mapper/repository/media_repository.dart';

import '../model/media.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaDataSource _mediaDataSource;

  MediaRepositoryImpl(this._mediaDataSource);

  @override
  Future<Media?> getMedia(int id) async {
    final mediaDto = await _mediaDataSource.getMedia(id);

    return mediaDto?.toMedia();
  }

  @override
  Future<List<Media>> getMedias() async {
    final mediasDto = await _mediaDataSource.getMedias();
    return mediasDto.map((dto) => dto.toMedia()).toList();
  }
}
