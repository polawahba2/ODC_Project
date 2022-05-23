import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Screens/SplashScreen/SplashScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: K_WHITE_Color,
          appBarTheme: const AppBarTheme(
            color: K_WHITE_Color,
          )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
