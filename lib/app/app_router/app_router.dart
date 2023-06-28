import 'package:flutter/material.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  AppRouter._internal();

  factory AppRouter() => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dynamic goBack([dynamic popValue]) {
    return navigatorKey.currentState?.pop(popValue);
  }

  Future<dynamic> navigateToPage(Widget page, {arguments}) async =>
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => page),
      );

  Future<dynamic> navigateAndRemoveAllRoutes(Widget page, {arguments}) async =>
      navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => page), (route) => false);
}
