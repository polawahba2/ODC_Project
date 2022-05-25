import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_project/Compounent/MyButton.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';
import 'package:odc_project/Screens/HomeScreen/HomeScreen.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/ForgetPasswordFormBuilder.dart';

class ProcessCompletedScreen extends StatelessWidget {
  ProcessCompletedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCubit = AppCubit.getCubit(context);
    var size = MediaQuery.of(context).size;

    return ForgetPasswordFormBuilder(
        locationOfImage: 'assets/images/StepThreeExam.svg',
        appBarText: 'Result ',
        text: '',
        customButton: MyButton(
          text: 'Back To Home',
          color: K_ORANGE_COLOR,
          textColor: K_WHITE_Color,
          buttonInLogInScreen: true,
          press: () {
            pushReplacement(route: const HomeScreen(), context: context);
          },
        ),
        thirdCompounentOfScreen: SizedBox(
          width: size.width,
          child: Column(
            children: [
              Image.asset(
                'assets/images/Congrats.png',
                height: size.height * 0.3,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const Text(
                'Wait For the Call',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: K_W600,
                ),
              ),
              SizedBox(
                height: 50,
                child: Expanded(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
