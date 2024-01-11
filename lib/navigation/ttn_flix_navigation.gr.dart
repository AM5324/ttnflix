// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:ttn_flix/presentation/home/home_screen.dart' as _i1;

abstract class $TtnFlixAppRouter extends _i2.RootStackRouter {
  $TtnFlixAppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomeScreen(key: args.key),
      );
    }
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i2.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i2.PageInfo<HomeScreenRouteArgs> page =
      _i2.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}
