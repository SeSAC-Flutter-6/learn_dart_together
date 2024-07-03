import '../model/media.dart';

abstract interface class MediaRepository {
  Future<List<Media>> getMedias();

  Future<Media?> getMedia(int id);
}
