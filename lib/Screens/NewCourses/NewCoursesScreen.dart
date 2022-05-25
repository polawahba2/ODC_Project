import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Screens/CourseDetails.dart/CourseDetailsScreen.dart';
import 'package:odc_project/Screens/CourseDetails.dart/CourseDetailsScreenForAllCourses.dart';

import '../../Compounent/CourseImageAndInfoBuilder.dart';
import '../../Cubit/AppCubit/AppCubit.dart';

class NewCoursesScreen extends StatelessWidget {
  const NewCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var myCubit = AppCubit.getCubit(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Courses',
          style: TextStyle(
            color: K_BLACK_Color,
            fontSize: 19,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: K_BLACK_Color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        myCubit.getCourseByItsId(
                            myCubit.allCoursesModel!.data![index].id!.toInt());
                        pushOnly(
                            route:
                                CourseDetailsScreenForAllCourses(index: index),
                            context: context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CourseImageAndInfoBuilder(
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
                        ),
                      ),
                    );
                  },
                  itemCount: myCubit.allCoursesModel!.data!.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: Colors.grey[200],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
