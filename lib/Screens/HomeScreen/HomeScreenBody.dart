import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';
import 'package:odc_project/Cubit/AppCubit/AppStates.dart';
import 'package:odc_project/Screens/Categories/CategoriesScreen.dart';
import 'package:odc_project/Compounent/CategoryImageAndText.dart';
import 'package:odc_project/Screens/HomeScreen/SliderElementBuilder.dart';

import '../../Compounent/Consts.dart';
import '../CourseDetails.dart/CourseDetailsScreenForAllCourses.dart';
import '../NewCourses/NewCoursesScreen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppSataes>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = AppCubit.getCubit(context);
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
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        // width: size.width * 0.13,
                                        height: size.height * 0.07,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              43, 43, 43, 1),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Enter code',
                                            hintStyle:
                                                K_HINT_TEXT_STYLE_SIGN_UP,
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
                                      onPressed: () {
                                        print(token);
                                      },
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
                                style:
                                    TextStyle(fontSize: 20, fontWeight: K_W600),
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
                        SizedBox(
                          height: size.height * 0.15,
                          width: size.width,
                          child: ConditionalBuilder(
                            condition:
                                AppCubit.getCubit(context).categoriesModel !=
                                    null,
                            builder: (context) {
                              return ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CategoryImageAndText(
                                    text: myCubit.categoriesModel!.data![index]
                                        .categoryName
                                        .toString(),
                                    imageUrl: myCubit
                                        .categoriesModel!.data![index].imageUrl
                                        .toString(),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox();
                                },
                                itemCount: 3,
                              );
                            },
                            fallback: (BuildContext context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              const Text(
                                'New Courses',
                                style:
                                    TextStyle(fontSize: 20, fontWeight: K_W600),
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
                        ConditionalBuilder(
                            condition: myCubit.allCoursesModel != null,
                            fallback: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            builder: (context) {
                              return SizedBox(
                                height: size.height * 0.320,
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        myCubit.getCourseByItsId(myCubit
                                            .allCoursesModel!.data![index].id!
                                            .toInt());
                                        pushOnly(
                                            route:
                                                CourseDetailsScreenForAllCourses(
                                                    index: index),
                                            context: context);
                                      },
                                      child: SliderElementBuilder(
                                        imageUrl:
                                            ('${myCubit.allCoursesModel!.data![index].imageUrl}'),
                                        courseName:
                                            ('${myCubit.allCoursesModel!.data![index].courseName}'),
                                        courseDetails:
                                            ('Learn ${myCubit.allCoursesModel!.data![index].courseName} From Scratch'),
                                        courseInstructor:
                                            ('${myCubit.allCoursesModel!.data![index].admin!.adminName}'),
                                      ),
                                    );
                                  },
                                  itemCount:
                                      myCubit.allCoursesModel!.data!.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 22,
                                    );
                                  },
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
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
