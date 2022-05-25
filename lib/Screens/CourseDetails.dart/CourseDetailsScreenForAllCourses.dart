import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Compounent/MyButton.dart';
import 'package:odc_project/Cubit/AppCubit/AppStates.dart';
import 'package:odc_project/Screens/AllExamScreens.dart/StartCourseExam.dart';

import '../../Compounent/CourseImageAndInfoBuilder.dart';
import '../../Cubit/AppCubit/AppCubit.dart';

class CourseDetailsScreenForAllCourses extends StatelessWidget {
  int index;
  CourseDetailsScreenForAllCourses({Key? key, required this.index})
      : super(key: key);
  String text =
      "Welcome to your UX Design for Beginners Course. In the following tutorials, you'll get a thorough introduction to UX design, from its definition, areas and origins through to the skills you need to build a professional portfolio and become a UX designer. ";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var myCubit = AppCubit.getCubit(context);

    var myModel = myCubit.allCoursesModel!.data![index];
    return BlocConsumer<AppCubit, AppSataes>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: myCubit.allCoursesModel!.data != null,
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.35,
                          child: Stack(
                            children: [
                              Image(
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                                image: NetworkImage('${myModel.imageUrl}'),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: K_WHITE_Color,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Text(
                            ('Learn ${myModel.courseName} for beginners'),
                            style: const TextStyle(
                              color: K_BLACK_Color,
                              fontSize: 22,
                              fontWeight: K_W600,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Text(
                            ('${myModel.admin!.adminName}'),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MyButton(
                            buttonInLogInScreen: true,
                            text: 'Start Course',
                            color: K_ORANGE_COLOR,
                            press: () => pushOnly(
                                route: StartCourseExam(
                                  index: index,
                                ),
                                context: context),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'About This Course ',
                          style: TextStyle(
                            color: K_BLACK_Color,
                            fontSize: 15,
                            fontWeight: K_W600,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: size.height * 0.13,
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.signal_cellular_alt,
                                color: K_ORANGE_COLOR),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              ('${myModel.courseLevel}'),
                              style: const TextStyle(
                                color: K_BLACK_Color,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              color: K_ORANGE_COLOR,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Cairo ',
                              style: TextStyle(
                                color: K_BLACK_Color,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'you may interested in  ',
                          style: TextStyle(
                            color: K_BLACK_Color,
                            fontSize: 14,
                            fontWeight: K_W600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ConditionalBuilder(
                          condition: myCubit.allCoursesModel != null,
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          builder: (context) {
                            return SizedBox(
                              height: size.height * 0.1,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CourseImageAndInfoBuilder(
                                    size: size,
                                    courseImage: Image(
                                      image: NetworkImage(
                                        ('${myCubit.allCoursesModel!.data![index].imageUrl}'),
                                      ),
                                      width: size.width * 0.27,
                                      height: size.height * 0.10,
                                      fit: BoxFit.fill,
                                    ),
                                    courseMainText:
                                        ('${myCubit.allCoursesModel!.data![index].courseName}'),
                                    courseSecoundText:
                                        ('${myCubit.allCoursesModel!.data![index].admin!.adminName}'),
                                  );
                                },
                                itemCount:
                                    myCubit.allCoursesModel!.data!.length,
                                separatorBuilder: (context, index) {
                                  return Container(
                                    width: 10,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
