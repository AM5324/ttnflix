// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:ttn_flix/data/models/movie.dart' as _i5;
import 'package:ttn_flix/presentation/detail/detail_screen.dart' as _i1;
import 'package:ttn_flix/presentation/home/home_screen.dart' as _i2;

abstract class $TtnFlixAppRouter extends _i3.RootStackRouter {
  $TtnFlixAppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailScreenRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailScreen]
class DetailScreenRoute extends _i3.PageRouteInfo<DetailScreenRouteArgs> {
  DetailScreenRoute({
    _i4.Key? key,
    required _i5.Results movie,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DetailScreenRoute.name,
          args: DetailScreenRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailScreenRoute';

  static const _i3.PageInfo<DetailScreenRouteArgs> page =
      _i3.PageInfo<DetailScreenRouteArgs>(name);
}

class DetailScreenRouteArgs {
  const DetailScreenRouteArgs({
    this.key,
    required this.movie,
  });

  final _i4.Key? key;

  final _i5.Results movie;

  @override
  String toString() {
    return 'DetailScreenRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i3.PageInfo<HomeScreenRouteArgs> page =
      _i3.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}
