import 'package:auto_route/auto_route.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.gr.dart';
import 'package:ttn_flix/presentation/login/log_in_screen.dart';
import 'package:ttn_flix/presentation/login/register_screen.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class TtnFlixAppRouter extends $TtnFlixAppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LogInScreenRoute.page, initial: true),
    AutoRoute(page: RegisterScreenRoute.page),
    AutoRoute(page: HomeScreenRoute.page),
    AutoRoute(page: DetailScreenRoute.page),

  ];
}