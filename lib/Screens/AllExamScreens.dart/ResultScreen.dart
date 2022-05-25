import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_project/Compounent/MyButton.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/ForgetPasswordFormBuilder.dart';
import 'ExamScreenBuilder.dart';
import 'ProcessCompletedScreen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCubit = AppCubit.getCubit(context);
    var size = MediaQuery.of(context).size;

    return ExamScreenBuilder(
      firstImageUrl: 'assets/images/StepTwoExam.svg',
      secoundImageUrl: 'assets/images/ExamImage2.svg',
      textOne: '',
      appBarText: 'Result',
      thirdCompounent: SizedBox(
        width: size.width,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/ExamImage2.svg',
              height: size.height * 0.2,
              width: size.width * 0.04,
            ),
            const Text(
              'Waiting for Result',
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
        pushOnly(route: ProcessCompletedScreen(), context: context);
      },
      buttonText: 'Next',
    );
  }
}
