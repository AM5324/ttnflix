import 'package:auto_route/auto_route.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class TtnFlixAppRouter extends $TtnFlixAppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TTNFlixBottomBarRoute.page, initial: false),
        AutoRoute(page: LogInScreenRoute.page,initial: true),
        AutoRoute(page: RegisterScreenRoute.page),
        AutoRoute(page: HomeScreenRoute.page),
        AutoRoute(page: DetailScreenRoute.page),
        AutoRoute(page: FavouraiteScreenRoute.page),
        AutoRoute(page: AccountScreenRoute.page),
      ];
}
