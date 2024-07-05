import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/19_result/photo/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<Result<List<PhotoDto>, String>> getPhotos(String query);
}

class MockPhotoDataSource implements PhotoDataSource {
  static const _baseUrl = 'https://pixabay.com/api/';
  static const _key = '44778600-cfe08ce4b2d6f2bb2ce5be47c';

  @override
  Future<Result<List<PhotoDto>, String>> getPhotos(String query) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl?key=$_key&q=$query'));
      if (response.statusCode == 200) {
        final List jsonList = jsonDecode(response.body)["hits"];
        final dtos = jsonList.map((e) => PhotoDto.fromJson(e)).toList();
        return Result.success(dtos);
      } else {
        return Result.error('Failed to fetch photos.');
      }
    } catch (e) {
      return Result.error('$e');
    }
  }
}
