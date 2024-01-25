// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:ttn_flix/data/models/movie.dart' as _i8;
import 'package:ttn_flix/presentation/bottom_bar/ttn_flix_bottom_bar.dart'
    as _i5;
import 'package:ttn_flix/presentation/detail/detail_screen.dart' as _i1;
import 'package:ttn_flix/presentation/home/home_screen.dart' as _i2;
import 'package:ttn_flix/presentation/login/log_in_screen.dart' as _i3;
import 'package:ttn_flix/presentation/login/register_screen.dart' as _i4;

abstract class $TtnFlixAppRouter extends _i6.RootStackRouter {
  $TtnFlixAppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailScreenRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
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
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(key: args.key),
      );
    },
    LogInScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LogInScreenRouteArgs>(
          orElse: () => const LogInScreenRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LogInScreen(key: args.key),
      );
    },
    RegisterScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterScreenRouteArgs>(
          orElse: () => const RegisterScreenRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.RegisterScreen(key: args.key),
      );
    },
    TTNFlixBottomBarRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TTNFlixBottomBar(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailScreen]
class DetailScreenRoute extends _i6.PageRouteInfo<DetailScreenRouteArgs> {
  DetailScreenRoute({
    _i7.Key? key,
    required _i8.Results movie,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DetailScreenRoute.name,
          args: DetailScreenRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailScreenRoute';

  static const _i6.PageInfo<DetailScreenRouteArgs> page =
      _i6.PageInfo<DetailScreenRouteArgs>(name);
}

class DetailScreenRouteArgs {
  const DetailScreenRouteArgs({
    this.key,
    required this.movie,
  });

  final _i7.Key? key;

  final _i8.Results movie;

  @override
  String toString() {
    return 'DetailScreenRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i6.PageInfo<HomeScreenRouteArgs> page =
      _i6.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.LogInScreen]
class LogInScreenRoute extends _i6.PageRouteInfo<LogInScreenRouteArgs> {
  LogInScreenRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LogInScreenRoute.name,
          args: LogInScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LogInScreenRoute';

  static const _i6.PageInfo<LogInScreenRouteArgs> page =
      _i6.PageInfo<LogInScreenRouteArgs>(name);
}

class LogInScreenRouteArgs {
  const LogInScreenRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LogInScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterScreenRoute extends _i6.PageRouteInfo<RegisterScreenRouteArgs> {
  RegisterScreenRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          RegisterScreenRoute.name,
          args: RegisterScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterScreenRoute';

  static const _i6.PageInfo<RegisterScreenRouteArgs> page =
      _i6.PageInfo<RegisterScreenRouteArgs>(name);
}

class RegisterScreenRouteArgs {
  const RegisterScreenRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'RegisterScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.TTNFlixBottomBar]
class TTNFlixBottomBarRoute extends _i6.PageRouteInfo<void> {
  const TTNFlixBottomBarRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TTNFlixBottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TTNFlixBottomBarRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
