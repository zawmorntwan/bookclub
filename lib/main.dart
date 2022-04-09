import 'package:bookclub/routes.dart';
import 'package:bookclub/screens/login/login.dart';
import 'package:bookclub/states/current_user.dart';
import 'package:bookclub/utils/our_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        routes: getRoutes(),
        initialRoute: OurLogin.route,
      ),
    );
  }
}
