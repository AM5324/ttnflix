// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int?,
      json['page'] as int?,
      json['total_results'] as int?,
    );

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      json['title'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      json['original_language'] as String?,
      json['release_date'] as String?,
      json['vote_count'] as int?,
    );
