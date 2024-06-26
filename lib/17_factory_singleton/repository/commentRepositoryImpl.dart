import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/17_factory_singleton/model/comment_model.dart';
import 'package:learn_dart_together/17_factory_singleton/repository/commentRepository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final Comment commentRepository;

  CommentRepositoryImpl(this.commentRepository);

//직접 구현 해야 하니 여기서 파싱도 하고 그래야하나봐
  @override
  Future<List<Comment>> getComments(int postId) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments/$postId'),
    );

    return [];
  }
}
