import 'package:flicked_app/models/app_config.dart';
import 'package:get_it/get_it.dart';

class MovieModel {
  final String? name;
  final String? language;
  final bool? isAdult;
  final String? description;
  final String? posterPath;
  final String? backgroungPath;
  final num? rating;
  final String? releaseDate;

  MovieModel({
    this.name,
    this.language,
    this.isAdult,
    this.description,
    this.posterPath,
    this.backgroungPath,
    this.rating,
    this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> _json) {
    return MovieModel(
      name: _json['title'],
      language: _json['original_language'],
      isAdult: _json['adult'],
      description: _json['overview'],
      posterPath: _json['poster_path'],
      backgroungPath: _json['backdrop_path'],
      rating: _json['vote_average'],
      releaseDate: _json['release_date'],
    );
  }

  String posterUrl() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.baseImageApiUrl}$posterPath';
  }
}
