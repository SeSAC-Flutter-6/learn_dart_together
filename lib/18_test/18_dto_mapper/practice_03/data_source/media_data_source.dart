abstract interface class MediaDataSource {
  Future<List<MediaDto>> getMedias();

  Future<MediaDto?> getMedia(int id);

}