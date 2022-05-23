import 'dart:io';

import 'package:flutter/material.dart';
import 'package:odc_project/Screens/Categories/CategoriesScreen.dart';
import 'package:odc_project/Compounent/CategoryImageAndText.dart';
import 'package:odc_project/Screens/HomeScreen/SliderElementBuilder.dart';

import '../../Compounent/Consts.dart';
import '../NewCourses/NewCoursesScreen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: buildHomeScreenLogo(size),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.235,
                    decoration: BoxDecoration(
                      color: K_HOME_SCREEN_BLACK_COLOR,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '''Enter the Code to
            Get your course''',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  // width: size.width * 0.13,
                                  height: size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(43, 43, 43, 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter code',
                                      hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                                      border: InputBorder.none,
                                    ),
                                    // controller: ,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          !value.contains('@')) {
                                        return 'enter valid Email';
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.01),
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: K_WHITE_Color,
                                  size: size.height * 0.035,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: K_ORANGE_COLOR,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(10),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7.7, right: 7.0),
                    child: Container(
                      height: 4,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        color: K_ORANGE_COLOR,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Text(
                          'Top Category',
                          style: TextStyle(fontSize: 20, fontWeight: K_W600),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              pushOnly(
                                  route: const CategoriesScreen(),
                                  context: context);
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 12,
                                color: K_BLACK_Color,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryImageAndText(text: 'Web Development'),
                      CategoryImageAndText(text: 'Programming Languages'),
                      CategoryImageAndText(text: 'Graphics'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Text(
                          'New Courses',
                          style: TextStyle(fontSize: 20, fontWeight: K_W600),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              pushOnly(
                                  route: const NewCoursesScreen(),
                                  context: context);
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 12,
                                color: K_ORANGE_COLOR,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.320,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SliderElementBuilder(
                          courseName: 'Web Development',
                          courseDetails: 'Become a Web Developer from Scratch',
                          courseInstructor: 'Ahmed Abaza ',
                        );
                      },
                      itemCount: 4,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 22,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildHomeScreenLogo(size) {
  return Row(
    children: [
      Image.asset(
        'assets/images/OrangeLogo.png',
        height: 45,
        width: 45,
      ),
      Column(
        children: const [
          Text(
            'ODC',
            style: TextStyle(fontSize: 17, fontWeight: K_W600),
          ),
          Text(
            'Egypt',
            style: TextStyle(fontSize: 17, fontWeight: K_W600),
          ),
        ],
      ),
    ],
  );
}
