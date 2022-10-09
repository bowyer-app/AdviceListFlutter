// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/domain/advice.dart' as _i5;
import 'package:app/ui/advice/advice_tab_page.dart' as _i1;
import 'package:app/ui/advice/edit/advice_edit_page.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AdviceTabRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdviceTabPage(),
      );
    },
    AdviceEditRoute.name: (routeData) {
      final args = routeData.argsAs<AdviceEditRouteArgs>(
          orElse: () => const AdviceEditRouteArgs());
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.AdviceEditPage(
          advice: args.advice,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          AdviceTabRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          AdviceEditRoute.name,
          path: '/adviceEdit',
        ),
      ];
}

/// generated route for
/// [_i1.AdviceTabPage]
class AdviceTabRoute extends _i3.PageRouteInfo<void> {
  const AdviceTabRoute()
      : super(
          AdviceTabRoute.name,
          path: '/',
        );

  static const String name = 'AdviceTabRoute';
}

/// generated route for
/// [_i2.AdviceEditPage]
class AdviceEditRoute extends _i3.PageRouteInfo<AdviceEditRouteArgs> {
  AdviceEditRoute({
    _i5.Advice? advice,
    _i6.Key? key,
  }) : super(
          AdviceEditRoute.name,
          path: '/adviceEdit',
          args: AdviceEditRouteArgs(
            advice: advice,
            key: key,
          ),
        );

  static const String name = 'AdviceEditRoute';
}

class AdviceEditRouteArgs {
  const AdviceEditRouteArgs({
    this.advice,
    this.key,
  });

  final _i5.Advice? advice;

  final _i6.Key? key;

  @override
  String toString() {
    return 'AdviceEditRouteArgs{advice: $advice, key: $key}';
  }
}
