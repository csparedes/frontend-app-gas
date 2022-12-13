import 'package:flutter/material.dart';

class NavigationServices {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String route) {
    navigatorKey.currentState!.pushNamed(route);
  }

  static replaceTo(String route) {
    navigatorKey.currentState!.pushReplacementNamed(route);
  }

  static popUntil(String route) {
    navigatorKey.currentState!.pushReplacementNamed(route);
    navigatorKey.currentState!.popUntil((route) => true);
  }

  static pop() => navigatorKey.currentState!.pop();

  static pushReplacement(String route) {
    navigatorKey.currentState!.pop();
    navigatorKey.currentState!.pushReplacementNamed(route);
  }
}
