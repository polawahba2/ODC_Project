import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Compounent/MyButton.dart';
import 'package:odc_project/Screens/LogIn/LogInScree.dart';
import 'package:odc_project/Screens/SignUp/SignUpScreen.dart';
import 'package:odc_project/Shared/CasheHelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final CONTROLLER = PageController();
  @override
  void dispose() {
    CONTROLLER.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: K_WHITE_Color,
      body: SizedBox(
        height: size.height * 0.77,
        width: double.infinity,
        child: PageView(
          controller: CONTROLLER,
          children: [
            pageBuilder(
              text: 'learn a lot of courses is orange education',
              hint:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              image: SvgPicture.asset(
                'assets/images/onBoarding1.svg',
              ),
            ),
            pageBuilder(
              text: 'learn a lot of courses is orange education',
              hint:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              image: SvgPicture.asset(
                'assets/images/onBoarding 2.svg',
              ),
            ),
            pageBuilder(
              text: 'learn a lot of courses is orange education',
              hint:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              image: SvgPicture.asset(
                'assets/images/onBoarding3.svg',
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: K_WHITE_Color,
        width: double.infinity,
        height: size.height * 0.23,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SmoothPageIndicator(
              controller: CONTROLLER,
              count: 3,
              effect: WormEffect(
                dotHeight: size.height * 0.011,
                dotWidth: size.width * 0.024,
                activeDotColor: K_ORANGE_COLOR,
              ),
            ),
            SizedBox(
              height: size.height * 0.058,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0, right: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    text: 'Join Now',
                    color: K_ORANGE_COLOR,
                    press: () {
                      endOnBoardingScreen(SignUpScreen());
                    },
                    textColor: K_WHITE_Color,
                    boarderColor: K_ORANGE_COLOR,
                  ),
                  MyButton(
                    text: 'Log in',
                    color: K_WHITE_Color,
                    press: () {
                      endOnBoardingScreen(LogInScreen());
                    },
                    textColor: K_ORANGE_COLOR,
                    boarderColor: K_ORANGE_COLOR,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void endOnBoardingScreen(Widget route) {
    CashHelper.saveData(key: 'onBoarding', value: true).then(
      (value) {
        if (value) {
          pushReplacement(route: route, context: context);
        }
      },
    );
  }
}

Widget pageBuilder({
  required String text,
  required String hint,
  required var image,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 50.0,
      left: 25,
      right: 25,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        image,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: K_SPLASH_SCREEN_ODC_TEXT_STYLE,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            hint,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    ),
  );
}
