import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/recycle_bin_screen.dart';
import 'package:flutter_tasks_app/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => RecycleBinScreen(),
        );
      case TabsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => TabsScreen(),
        );
      default:
        return null;
    }
  }
}
