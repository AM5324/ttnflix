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

@JsonSerializable(createToJson: true)
class Results{
  final int? id;
  final String? title;
  final String? overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  final bool? adult;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  bool? isFavourite;

  Results(this.id, this.title, this.overview, this.posterPath, this.adult, this.backdropPath, this.originalLanguage, this.releaseDate, this.voteCount, this.isFavourite);

  factory Results.fromJson(Map<String, dynamic> map) =>
      _$ResultsFromJson(map);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);

  String getContentRating() {
    return adult! ? "A" : "U/A";
  }

  @override
  String toString() {
    return 'Results{'
        'id: $id, '
        'title: $title, '
        'overview: $overview, '
        'posterPath: $posterPath, '
        'adult: $adult, '
        'originalLanguage: $originalLanguage, '
        'backdropPath: $backdropPath, '
        'releaseDate: $releaseDate, '
        'voteCount: $voteCount, '
        'isFavourite: $isFavourite '
        '}';
  }

}
