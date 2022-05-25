import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_project/Compounent/MyButton.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';
import 'package:odc_project/Screens/AllExamScreens.dart/ExamScreenBuilder.dart';
import 'package:odc_project/Screens/AllExamScreens.dart/ResultScreen.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/ForgetPasswordFormBuilder.dart';

class HrInterViewScreen extends StatelessWidget {
  HrInterViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCubit = AppCubit.getCubit(context);
    var size = MediaQuery.of(context).size;

    return ExamScreenBuilder(
      firstImageUrl: 'assets/images/StepOneExam.svg',
      secoundImageUrl: 'assets/images/ExamImage1.svg',
      textOne: '',
      appBarText: 'Hr Interview',
      thirdCompounent: SizedBox(
        width: size.width,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/ExamImage1.svg',
              height: size.height * 0.2,
              width: size.width * 0.04,
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
      ),
      press: () {
        pushOnly(route: ResultScreen(), context: context);
      },
      buttonText: 'Next',
    );
  }
}
