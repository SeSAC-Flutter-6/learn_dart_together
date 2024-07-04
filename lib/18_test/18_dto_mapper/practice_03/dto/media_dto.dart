import 'dart:io';

class PhotoDto {
  int? id;
  String? title;
  String? content;
  String? url;
  String? caption;
  DateTime? createdAt;
  ContentType type;

  PhotoDto ({
    this.id,
    this.title,
    this.content,
    this.url,
    this.caption,
    this.createdAt,
    required this.type,
});


}