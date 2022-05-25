import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Compounent/MyButton.dart';
import 'package:odc_project/Screens/AllExamScreens.dart/HrInterViewScreen.dart';
import 'package:odc_project/Screens/AllExamScreens.dart/StartCourseExam.dart';

class ExamScreen extends StatelessWidget {
  ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Course Exam',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Question 1',
                  style: TextStyle(
                    color: K_BLACK_Color,
                    fontSize: 30,
                    fontWeight: K_W600,
                  ),
                ),
                const Text(
                  'what is the use experiace ?',
                  style: TextStyle(
                    color: K_BLACK_Color,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomRadioButton(
                    unSelectedBorderColor: K_ORANGE_COLOR,
                    selectedBorderColor: K_ORANGE_COLOR,
                    enableShape: true,
                    shapeRadius: 20,
                    height: 60,
                    unSelectedColor: Colors.white,
                    horizontal: true,
                    buttonLables: const [
                      "Answer one",
                      "Answer two",
                      "Answer three",
                    ],
                    buttonValues: const [
                      "STUDENT",
                      "TEACHER",
                      "a",
                    ],
                    radioButtonValue: (value) => print(value),
                    selectedColor: K_ORANGE_COLOR,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: MyButton(
                    text: 'Skip Exam',
                    color: K_ORANGE_COLOR,
                    press: () {
                      pushOnly(route: HrInterViewScreen(), context: context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
