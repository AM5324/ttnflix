import 'package:auto_route/auto_route.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.gr.dart';
import 'package:ttn_flix/presentation/account/account_screen.dart';
import 'package:ttn_flix/presentation/bottom_bar/ttn_flix_bottom_bar.dart';
import 'package:ttn_flix/presentation/favouraite/favouraite_screen.dart';
import 'package:ttn_flix/presentation/login/log_in_screen.dart';
import 'package:ttn_flix/presentation/login/register_screen.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class TtnFlixAppRouter extends $TtnFlixAppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: TTNFlixBottomBarRoute.page),
    AutoRoute(page: LogInScreenRoute.page, initial: true),
    AutoRoute(page: RegisterScreenRoute.page),
    AutoRoute(page: HomeScreenRoute.page),
    AutoRoute(page: DetailScreenRoute.page),
    AutoRoute(page: FavouraiteScreenRoute.page),
    AutoRoute(page: AccountScreenRoute.page),

  ];
}