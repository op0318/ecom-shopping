import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider(),)],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


Authservice authservice=Authservice();
  void initState()
  {
    super.initState();
    authservice.GetUserData(context);
  }
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
      home:Provider.of<UserProvider>(context).user.token.isNotEmpty?
      const BottomBar():AuthScreen()

    );
  }
}

