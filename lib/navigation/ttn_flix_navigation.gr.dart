// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:ttn_flix/data/models/movie.dart' as _i10;
import 'package:ttn_flix/presentation/account/account_screen.dart' as _i1;
import 'package:ttn_flix/presentation/bottom_bar/ttn_flix_bottom_bar.dart'
    as _i7;
import 'package:ttn_flix/presentation/detail/detail_screen.dart' as _i2;
import 'package:ttn_flix/presentation/favouraite/favouraite_screen.dart' as _i3;
import 'package:ttn_flix/presentation/home/home_screen.dart' as _i4;
import 'package:ttn_flix/presentation/login/log_in_screen.dart' as _i5;
import 'package:ttn_flix/presentation/login/register_screen.dart' as _i6;

abstract class $TtnFlixAppRouter extends _i8.RootStackRouter {
  $TtnFlixAppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AccountScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AccountScreenRouteArgs>(
          orElse: () => const AccountScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AccountScreen(key: args.key),
      );
    },
    DetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailScreenRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    FavouraiteScreenRoute.name: (routeData) {
      final args = routeData.argsAs<FavouraiteScreenRouteArgs>(
          orElse: () => const FavouraiteScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.FavouraiteScreen(key: args.key),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeScreen(key: args.key),
      );
    },
    LogInScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LogInScreenRouteArgs>(
          orElse: () => const LogInScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LogInScreen(key: args.key),
      );
    },
    RegisterScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterScreenRouteArgs>(
          orElse: () => const RegisterScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RegisterScreen(key: args.key),
      );
    },
    TTNFlixBottomBarRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TTNFlixBottomBar(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountScreenRoute extends _i8.PageRouteInfo<AccountScreenRouteArgs> {
  AccountScreenRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AccountScreenRoute.name,
          args: AccountScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AccountScreenRoute';

  static const _i8.PageInfo<AccountScreenRouteArgs> page =
      _i8.PageInfo<AccountScreenRouteArgs>(name);
}

class AccountScreenRouteArgs {
  const AccountScreenRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'AccountScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.DetailScreen]
class DetailScreenRoute extends _i8.PageRouteInfo<DetailScreenRouteArgs> {
  DetailScreenRoute({
    _i9.Key? key,
    required _i10.Results movie,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          DetailScreenRoute.name,
          args: DetailScreenRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailScreenRoute';

  static const _i8.PageInfo<DetailScreenRouteArgs> page =
      _i8.PageInfo<DetailScreenRouteArgs>(name);
}

class DetailScreenRouteArgs {
  const DetailScreenRouteArgs({
    this.key,
    required this.movie,
  });

  final _i9.Key? key;

  final _i10.Results movie;

  @override
  String toString() {
    return 'DetailScreenRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i3.FavouraiteScreen]
class FavouraiteScreenRoute
    extends _i8.PageRouteInfo<FavouraiteScreenRouteArgs> {
  FavouraiteScreenRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          FavouraiteScreenRoute.name,
          args: FavouraiteScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FavouraiteScreenRoute';

  static const _i8.PageInfo<FavouraiteScreenRouteArgs> page =
      _i8.PageInfo<FavouraiteScreenRouteArgs>(name);
}

class FavouraiteScreenRouteArgs {
  const FavouraiteScreenRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'FavouraiteScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i8.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i8.PageInfo<HomeScreenRouteArgs> page =
      _i8.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.LogInScreen]
class LogInScreenRoute extends _i8.PageRouteInfo<LogInScreenRouteArgs> {
  LogInScreenRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LogInScreenRoute.name,
          args: LogInScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LogInScreenRoute';

  static const _i8.PageInfo<LogInScreenRouteArgs> page =
      _i8.PageInfo<LogInScreenRouteArgs>(name);
}

class LogInScreenRouteArgs {
  const LogInScreenRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'LogInScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterScreenRoute extends _i8.PageRouteInfo<RegisterScreenRouteArgs> {
  RegisterScreenRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          RegisterScreenRoute.name,
          args: RegisterScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterScreenRoute';

  static const _i8.PageInfo<RegisterScreenRouteArgs> page =
      _i8.PageInfo<RegisterScreenRouteArgs>(name);
}

class RegisterScreenRouteArgs {
  const RegisterScreenRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegisterScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.TTNFlixBottomBar]
class TTNFlixBottomBarRoute extends _i8.PageRouteInfo<void> {
  const TTNFlixBottomBarRoute({List<_i8.PageRouteInfo>? children})
      : super(
          TTNFlixBottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TTNFlixBottomBarRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
