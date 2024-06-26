import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_movies_response.g.dart';

@JsonSerializable()
class RemoteMoviesResponse {
  final int page;
  @JsonKey(name: "results")
  final List<MovieDto> movies;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "total_results")
  final int? totalResults;

  RemoteMoviesResponse({
    required this.page,
    required this.movies,
    this.totalPages,
    this.totalResults,
  });

  factory RemoteMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteMoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RemoteMoviesResponseToJson(this);
}

@JsonSerializable()
class MovieDto {
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  final int id;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  MovieDto(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      required this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);
}
