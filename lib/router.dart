import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/add_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: routeSettings,
      );
    case HomeScreen.routName:
      return MaterialPageRoute(
          builder: (_) => HomeScreen(), settings: routeSettings);
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => AddProductScreen(), settings: routeSettings);
    case BottomBar.routeName:
      return MaterialPageRoute(
          builder: (_) => BottomBar(), settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  body: Center(
                child: Text('Screen does not exist!'),
              )));
  }
}
