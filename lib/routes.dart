import 'package:flutter/material.dart';
import 'settings/settings_screen.dart';
import 'home/home_screen.dart';
import 'package:proste_route_animation/proste_route_animation.dart';

class Path {
  static const String home = '/';
  static const String settings = '/settings';
  //

  Path._();
  //

  static Route<dynamic> generateRoute(RouteSettings conf) {
    Widget path;
    switch (conf.name) {
      case home:
        path = const HomeScreen();
        break;
      case settings:
        path = const SettingsScreen();
        break;
      default:
        throw RouteException("Route not found");
    }
    return ProsteRouteAnimation.fadeRoute(route: path);
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
