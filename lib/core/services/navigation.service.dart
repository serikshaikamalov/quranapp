import 'package:flutter/material.dart';

/*
  Навигация по приложению: 
  - Перенаправялет на страницу по имени
  - Перенаправляет на страницу ранее
*/
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  goBack() {
    return navigatorKey.currentState.pop();
  }
}
