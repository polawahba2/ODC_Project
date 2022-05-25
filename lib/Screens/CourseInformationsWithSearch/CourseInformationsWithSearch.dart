import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Cubit/AppCubit/AppStates.dart';
import 'package:odc_project/Screens/CourseDetails.dart/CourseDetailsScreen.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/CourseImageAndInfoBuilder.dart';
import '../../Cubit/AppCubit/AppCubit.dart';

class CourseInformationsWithSerach extends StatelessWidget {
  int currentCategoryId;
  CourseInformationsWithSerach({
    required this.currentCategoryId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var myCubit = AppCubit.getCubit(context);

    return BlocConsumer<AppCubit, AppSataes>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              myCubit.categoriesModel!.data![currentCategoryId - 1].categoryName
                  .toString(),
              style: const TextStyle(
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    // width: size.width * 0.13,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter valid ';
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: size.height,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              pushOnly(
                                  route: CourseDetailsScreen(),
                                  context: context);
                            },
                            child: ConditionalBuilder(
                              condition:
                                  state is GetCourseByCategoryIdSucessfulState,
                              builder: (context) {
                                return CourseImageAndInfoBuilder(
                                  size: size,
                                  courseImage: Image(
                                    image: NetworkImage(
                                      '${myCubit.coursesByCategoryId!.data!.courses![index].imageUrl}',
                                    ),
                                    width: size.width * 0.27,
                                    height: size.height * 0.10,
                                    fit: BoxFit.fill,
                                  ),
                                  courseMainText:
                                      '${myCubit.coursesByCategoryId!.data!.courses![index].courseName}',
                                  courseSecoundText: 'Sayed Ali',
                                );
                              },
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        );
                      },
                      itemCount: 1,
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
      },
    );
  }
}
