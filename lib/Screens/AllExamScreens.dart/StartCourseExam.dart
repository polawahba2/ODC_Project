import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';
import 'package:odc_project/Screens/AllExamScreens.dart/ExamScreen.dart';

import '../../Compounent/Consts.dart';
import 'ExamScreenBuilder.dart';

class StartCourseExam extends StatelessWidget {
  int index;
  StartCourseExam({Key? key, required this.index}) : super(key: key);
  Widget build(BuildContext context) {
    var myCubit = AppCubit.getCubit(context);

    var myModel = myCubit.allCoursesModel!.data![index];
    var size = MediaQuery.of(context).size;

    return ExamScreenBuilder(
      appBarText: 'Course Exam',
      firstImageUrl: 'assets/images/StepZeroExam.svg',
      secoundImageUrl: 'assets/images/ExamImage0.svg',
      textOne: ('Learn ${myModel.courseName} for beginners'),
      press: () {
        pushOnly(route: ExamScreen(), context: context);
      },
      buttonText: 'Next',
      thirdCompounent: SizedBox(
        width: size.width,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/ExamImage0.svg',
              height: size.height * 0.2,
              width: size.width * 0.04,
            ),
            const Text(
              'Start Your Exam',
              style: TextStyle(
                fontSize: 19,
                fontWeight: K_W600,
              ),
            ),
            Row(
              children: const [
                Text(
                  'Exam Timer',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                // SizedBox(
                //   width: size.width * 0.2,
                // ),
                Spacer(),
                Text(
                  '1 Hr',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
