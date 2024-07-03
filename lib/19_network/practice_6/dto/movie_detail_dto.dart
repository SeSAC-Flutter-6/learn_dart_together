
class MovieDetailDto {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailDto({this.adult, this.backdropPath, this.belongsToCollection, this.budget, this.genres, this.homepage, this.id, this.imdbId, this.originCountry, this.originalLanguage, this.originalTitle, this.overview, this.popularity, this.posterPath, this.productionCompanies, this.productionCountries, this.releaseDate, this.revenue, this.runtime, this.spokenLanguages, this.status, this.tagline, this.title, this.video, this.voteAverage, this.voteCount});

  MovieDetailDto.fromJson(Map<String, dynamic> json) {
    if(json["adult"] is bool) {
      adult = json["adult"];
    }
    if(json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    belongsToCollection = json["belongs_to_collection"];
    if(json["budget"] is int) {
      budget = json["budget"];
    }
    if(json["genres"] is List) {
      genres = json["genres"] == null ? null : (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
    }
    if(json["homepage"] is String) {
      homepage = json["homepage"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["imdb_id"] is String) {
      imdbId = json["imdb_id"];
    }
    if(json["origin_country"] is List) {
      originCountry = json["origin_country"] == null ? null : List<String>.from(json["origin_country"]);
    }
    if(json["original_language"] is String) {
      originalLanguage = json["original_language"];
    }
    if(json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if(json["overview"] is String) {
      overview = json["overview"];
    }
    if(json["popularity"] is double) {
      popularity = json["popularity"];
    }
    if(json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if(json["production_companies"] is List) {
      productionCompanies = json["production_companies"] == null ? null : (json["production_companies"] as List).map((e) => ProductionCompanies.fromJson(e)).toList();
    }
    if(json["production_countries"] is List) {
      productionCountries = json["production_countries"] == null ? null : (json["production_countries"] as List).map((e) => ProductionCountries.fromJson(e)).toList();
    }
    if(json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if(json["revenue"] is int) {
      revenue = json["revenue"];
    }
    if(json["runtime"] is int) {
      runtime = json["runtime"];
    }
    if(json["spoken_languages"] is List) {
      spokenLanguages = json["spoken_languages"] == null ? null : (json["spoken_languages"] as List).map((e) => SpokenLanguages.fromJson(e)).toList();
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["tagline"] is String) {
      tagline = json["tagline"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["video"] is bool) {
      video = json["video"];
    }
    if(json["vote_average"] is double) {
      voteAverage = json["vote_average"];
    }
    if(json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["adult"] = adult;
    _data["backdrop_path"] = backdropPath;
    _data["belongs_to_collection"] = belongsToCollection;
    _data["budget"] = budget;
    if(genres != null) {
      _data["genres"] = genres?.map((e) => e.toJson()).toList();
    }
    _data["homepage"] = homepage;
    _data["id"] = id;
    _data["imdb_id"] = imdbId;
    if(originCountry != null) {
      _data["origin_country"] = originCountry;
    }
    _data["original_language"] = originalLanguage;
    _data["original_title"] = originalTitle;
    _data["overview"] = overview;
    _data["popularity"] = popularity;
    _data["poster_path"] = posterPath;
    if(productionCompanies != null) {
      _data["production_companies"] = productionCompanies?.map((e) => e.toJson()).toList();
    }
    if(productionCountries != null) {
      _data["production_countries"] = productionCountries?.map((e) => e.toJson()).toList();
    }
    _data["release_date"] = releaseDate;
    _data["revenue"] = revenue;
    _data["runtime"] = runtime;
    if(spokenLanguages != null) {
      _data["spoken_languages"] = spokenLanguages?.map((e) => e.toJson()).toList();
    }
    _data["status"] = status;
    _data["tagline"] = tagline;
    _data["title"] = title;
    _data["video"] = video;
    _data["vote_average"] = voteAverage;
    _data["vote_count"] = voteCount;
    return _data;
  }
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    if(json["english_name"] is String) {
      englishName = json["english_name"];
    }
    if(json["iso_639_1"] is String) {
      iso6391 = json["iso_639_1"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["english_name"] = englishName;
    _data["iso_639_1"] = iso6391;
    _data["name"] = name;
    return _data;
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    if(json["iso_3166_1"] is String) {
      iso31661 = json["iso_3166_1"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["iso_3166_1"] = iso31661;
    _data["name"] = name;
    return _data;
  }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["logo_path"] is String) {
      logoPath = json["logo_path"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["origin_country"] is String) {
      originCountry = json["origin_country"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["logo_path"] = logoPath;
    _data["name"] = name;
    _data["origin_country"] = originCountry;
    return _data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}