import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(createToJson: false)
class MovieResponse extends Equatable {
  List<Results>? results;

  MovieResponse({this.results});

  factory MovieResponse.fromJson(Map<String, dynamic> map) =>
      _$MovieResponseFromJson(map);

  @override
  // TODO: implement props
  List<Object?> get props => [results];
}

@JsonSerializable(createToJson: false)
class Results extends Equatable {
  String? title;
  String? overview;
  @JsonKey(name: ":poster_path")
  String? posterPath;

  Results({this.title, this.overview, this.posterPath});

  factory Results.fromJson(Map<String, dynamic> map) =>
      _$ResultsFromJson(map);

  @override
  // TODO: implement props
  List<Object?> get props => [title, overview, posterPath];

}
