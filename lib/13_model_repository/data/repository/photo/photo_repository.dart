import 'package:learn_dart_together/13_model_repository/data/model/photo.dart';

abstract interface class PhotoRepository{
  Future<List<Photo>> getPhotosByAlbumId(int albumId);
  Future<List<Photo>> getPhotos();
}