// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:astrology/pages/dashboard/dashboard.dart' as _i1;
import 'package:astrology/pages/forgot/forgot.dart' as _i2;
import 'package:astrology/pages/home/home.dart' as _i3;
import 'package:astrology/pages/splash/splash.dart' as _i4;
import 'package:auto_route/auto_route.dart' as _i5;

/// generated route for
/// [_i1.Dashboard]
class DashboardRouter extends _i5.PageRouteInfo<void> {
  const DashboardRouter({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRouter.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i1.Dashboard();
    },
  );
}

/// generated route for
/// [_i2.Forgot]
class ForgotRouter extends _i5.PageRouteInfo<void> {
  const ForgotRouter({List<_i5.PageRouteInfo>? children})
      : super(
          ForgotRouter.name,
          initialChildren: children,
        );

  static const String name = 'ForgotRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.Forgot();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRouter extends _i5.PageRouteInfo<void> {
  const HomeRouter({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRouter extends _i5.PageRouteInfo<void> {
  const SplashRouter({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRouter.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
