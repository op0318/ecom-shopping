import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
Route<dynamic> generateRoute(RouteSettings routeSettings)
{
  switch(routeSettings.name)
  {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          builder: (_)=>const AuthScreen(),
      settings: routeSettings,
      );
    default:
      return MaterialPageRoute(builder: (_)=>Scaffold(body:
        Center(
          child: Text('Screen does not exist!'),
        )));

  }

}