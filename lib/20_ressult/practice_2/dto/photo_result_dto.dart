class PhotoResultDto {
  int? total;
  int? totalPhotoDto;
  List<PhotoDto>? hits;

  PhotoResultDto({this.total, this.totalPhotoDto, this.hits});

  PhotoResultDto.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["totalPhotoDto"] is int) {
      totalPhotoDto = json["totalPhotoDto"];
    }
    if (json["hits"] is List) {
      hits = json["hits"] == null
          ? null
          : (json["hits"] as List).map((e) => PhotoDto.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["totalPhotoDto"] = totalPhotoDto;
    if (hits != null) {
      data["hits"] = hits?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class PhotoDto {
  int? id;
  String? pageUrl;
  String? type;
  String? tags;
  int? duration;
  Videos? videos;
  int? views;
  int? downloads;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageUrl;

  PhotoDto(
      {this.id,
      this.pageUrl,
      this.type,
      this.tags,
      this.duration,
      this.videos,
      this.views,
      this.downloads,
      this.likes,
      this.comments,
      this.userId,
      this.user,
      this.userImageUrl});

  PhotoDto.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["pageURL"] is String) {
      pageUrl = json["pageURL"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["tags"] is String) {
      tags = json["tags"];
    }
    if (json["duration"] is int) {
      duration = json["duration"];
    }
    if (json["videos"] is Map) {
      videos = json["videos"] == null ? null : Videos.fromJson(json["videos"]);
    }
    if (json["views"] is int) {
      views = json["views"];
    }
    if (json["downloads"] is int) {
      downloads = json["downloads"];
    }
    if (json["likes"] is int) {
      likes = json["likes"];
    }
    if (json["comments"] is int) {
      comments = json["comments"];
    }
    if (json["user_id"] is int) {
      userId = json["user_id"];
    }
    if (json["user"] is String) {
      user = json["user"];
    }
    if (json["userImageURL"] is String) {
      userImageUrl = json["userImageURL"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["pageURL"] = pageUrl;
    data["type"] = type;
    data["tags"] = tags;
    data["duration"] = duration;
    if (videos != null) {
      data["videos"] = videos?.toJson();
    }
    data["views"] = views;
    data["downloads"] = downloads;
    data["likes"] = likes;
    data["comments"] = comments;
    data["user_id"] = userId;
    data["user"] = user;
    data["userImageURL"] = userImageUrl;
    return data;
  }
}

class Videos {
  Large? large;
  Medium? medium;
  Small? small;
  Tiny? tiny;

  Videos({this.large, this.medium, this.small, this.tiny});

  Videos.fromJson(Map<String, dynamic> json) {
    if (json["large"] is Map) {
      large = json["large"] == null ? null : Large.fromJson(json["large"]);
    }
    if (json["medium"] is Map) {
      medium = json["medium"] == null ? null : Medium.fromJson(json["medium"]);
    }
    if (json["small"] is Map) {
      small = json["small"] == null ? null : Small.fromJson(json["small"]);
    }
    if (json["tiny"] is Map) {
      tiny = json["tiny"] == null ? null : Tiny.fromJson(json["tiny"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (large != null) {
      data["large"] = large?.toJson();
    }
    if (medium != null) {
      data["medium"] = medium?.toJson();
    }
    if (small != null) {
      data["small"] = small?.toJson();
    }
    if (tiny != null) {
      data["tiny"] = tiny?.toJson();
    }
    return data;
  }
}

class Tiny {
  String? url;
  int? width;
  int? height;
  int? size;
  String? thumbnail;

  Tiny({this.url, this.width, this.height, this.size, this.thumbnail});

  Tiny.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["width"] is int) {
      width = json["width"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["width"] = width;
    data["height"] = height;
    data["size"] = size;
    data["thumbnail"] = thumbnail;
    return data;
  }
}

class Small {
  String? url;
  int? width;
  int? height;
  int? size;
  String? thumbnail;

  Small({this.url, this.width, this.height, this.size, this.thumbnail});

  Small.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["width"] is int) {
      width = json["width"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["width"] = width;
    data["height"] = height;
    data["size"] = size;
    data["thumbnail"] = thumbnail;
    return data;
  }
}

class Medium {
  String? url;
  int? width;
  int? height;
  int? size;
  String? thumbnail;

  Medium({this.url, this.width, this.height, this.size, this.thumbnail});

  Medium.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["width"] is int) {
      width = json["width"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["width"] = width;
    data["height"] = height;
    data["size"] = size;
    data["thumbnail"] = thumbnail;
    return data;
  }
}

class Large {
  String? url;
  int? width;
  int? height;
  int? size;
  String? thumbnail;

  Large({this.url, this.width, this.height, this.size, this.thumbnail});

  Large.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["width"] is int) {
      width = json["width"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["width"] = width;
    data["height"] = height;
    data["size"] = size;
    data["thumbnail"] = thumbnail;
    return data;
  }
}
