import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amsazon_clone',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        primaryColor: GlobalVariables.secondaryColor,
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme:const AppBarTheme(elevation: 0),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:const AuthScreen(),
    );
  }
}

