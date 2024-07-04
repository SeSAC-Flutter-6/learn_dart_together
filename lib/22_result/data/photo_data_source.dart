import 'package:learn_dart_together/22_result/dto/photo_dto.dart';



abstract interface class PhotoDataSource {
  Future<List<Hits>> getPhotoData(String query);
}
