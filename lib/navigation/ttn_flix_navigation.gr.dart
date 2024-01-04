// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:ttn_flix/presentation/home/home_screen.dart' as _i1;

abstract class $TtnFlixAppRouter extends _i2.RootStackRouter {
  $TtnFlixAppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i2.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i2.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
