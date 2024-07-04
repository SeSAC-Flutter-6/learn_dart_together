class PhotoDto {
  int? id;
  String? pageUrl;
  String? type;
  String? tags;
  String? previewUrl;
  int? previewWidth;
  int? previewHeight;
  String? webformatUrl;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageUrl;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? collections;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageUrl;

  PhotoDto({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) => PhotoDto(
        id: json['id'] as int?,
        pageUrl: json['pageURL'] as String?,
        type: json['type'] as String?,
        tags: json['tags'] as String?,
        previewUrl: json['previewURL'] as String?,
        previewWidth: json['previewWidth'] as int?,
        previewHeight: json['previewHeight'] as int?,
        webformatUrl: json['webformatURL'] as String?,
        webformatWidth: json['webformatWidth'] as int?,
        webformatHeight: json['webformatHeight'] as int?,
        largeImageUrl: json['largeImageURL'] as String?,
        imageWidth: json['imageWidth'] as int?,
        imageHeight: json['imageHeight'] as int?,
        imageSize: json['imageSize'] as int?,
        views: json['views'] as int?,
        downloads: json['downloads'] as int?,
        collections: json['collections'] as int?,
        likes: json['likes'] as int?,
        comments: json['comments'] as int?,
        userId: json['user_id'] as int?,
        user: json['user'] as String?,
        userImageUrl: json['userImageURL'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pageURL': pageUrl,
        'type': type,
        'tags': tags,
        'previewURL': previewUrl,
        'previewWidth': previewWidth,
        'previewHeight': previewHeight,
        'webformatURL': webformatUrl,
        'webformatWidth': webformatWidth,
        'webformatHeight': webformatHeight,
        'largeImageURL': largeImageUrl,
        'imageWidth': imageWidth,
        'imageHeight': imageHeight,
        'imageSize': imageSize,
        'views': views,
        'downloads': downloads,
        'collections': collections,
        'likes': likes,
        'comments': comments,
        'user_id': userId,
        'user': user,
        'userImageURL': userImageUrl,
      };
}
