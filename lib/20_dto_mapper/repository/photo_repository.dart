import 'package:learn_dart_together/20_dto_mapper/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhoto();
}
