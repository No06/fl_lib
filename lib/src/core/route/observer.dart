part of 'route.dart';

enum RouteType { push, pop }

typedef RouteListener = void Function(
  RouteSettings? settings,
  RouteType type,
);

final class AppRouteObserver extends NavigatorObserver {
  static final _routes = <RouteSettings>[];
  static List<RouteSettings> get routes => _routes;

  static final listeners = <RouteListener>[];

  static final instance = AppRouteObserver._();

  AppRouteObserver._() : super();

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route is PageRoute) {
      _routes.add(route.settings);

      for (var e in listeners) {
        e(route.settings, RouteType.push);
      }
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route is PageRoute) {
      _routes.remove(route.settings);

      for (var e in listeners) {
        e(route.settings, RouteType.pop);
      }
    }
  }

  static void addListener(RouteListener listener) {
    listeners.add(listener);
  }

  static void removeListener(RouteListener listener) {
    listeners.remove(listener);
  }

  static RouteSettings? get currentRoute => _routes.lastOrNull;
}

interface class AppRouteObserverFunc {
  const AppRouteObserverFunc._();

  static void logUrl(RouteSettings? settings, RouteType type) {
    final url = settings?.name;
    // ignore: avoid_print
    print('[Route] ${type.name} $url');
  }
}
