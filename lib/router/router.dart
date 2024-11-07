import 'router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class ConfigRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRouter.page, path: '/'),
    AutoRoute(page: DashboardRouter.page),
    AutoRoute(page: HomeRouter.page),
    AutoRoute(page: ForgotRouter.page),
  ];
}
