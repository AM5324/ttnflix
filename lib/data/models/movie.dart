import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(createToJson: false)
class MovieResponse {
  final List<Results>? results;
  final int? page;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "total_results")
  final int? totalResults;

  const MovieResponse(this.results, this.totalPages, this.page, this.totalResults);

  factory MovieResponse.fromJson(Map<String, dynamic> map) =>
      _$MovieResponseFromJson(map);
}

@JsonSerializable(createToJson: false)
class Results{
  final String? title;
  final String? overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  final bool? adult;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;

  const Results(this.title, this.overview, this.posterPath, this.adult, this.backdropPath, this.originalLanguage);

  factory Results.fromJson(Map<String, dynamic> map) =>
      _$ResultsFromJson(map);

  String getContentRating() {
    return adult! ? "A" : "U/A";
  }

}
