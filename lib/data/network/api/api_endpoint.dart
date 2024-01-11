// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static const baseUrl = 'https://api.themoviedb.org/3/trending/movie/week?';
  static const imageBaseUrl =
      'https://image.tmdb.org/t/p/w185';
  static const Duration carouselTimeout = Duration(milliseconds: 3000);
  static const Duration carouselAnimateTimeout = Duration(milliseconds: 500);
  static const String apiKey = '060e7c76aff06a20ca4a875981216f3f';
  static const String getMovies = 'trending/movie/week';
}