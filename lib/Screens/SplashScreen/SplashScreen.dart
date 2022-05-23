import 'dart:async';

import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/LogoAndTextBuilder.dart';

import '../../Compounent/Consts.dart';
import '../OnBoardingScreens/OnBoardingScreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => pushReplacement(route: const OnBoardingScreens(), context: context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: K_WHITE_Color,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: LogoAndTextBuilder(),
        ),
      ),
    );
  }
}
