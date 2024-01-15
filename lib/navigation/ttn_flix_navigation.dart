import 'package:auto_route/auto_route.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class TtnFlixAppRouter extends $TtnFlixAppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeScreenRoute.page, initial: true),
    AutoRoute(page: DetailScreenRoute.page),
  ];
}