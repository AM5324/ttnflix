// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json[':poster_path'] as String?,
    );
