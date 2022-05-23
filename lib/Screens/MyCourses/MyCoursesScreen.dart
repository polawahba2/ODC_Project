import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';

import '../../Compounent/CourseImageAndInfoBuilder.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Courses',
              style: TextStyle(
                fontSize: 30,
                color: K_ORANGE_COLOR,
                fontWeight: K_W600,
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: size.height * 0.8,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CourseImageAndInfoBuilder(
                        size: size,
                        courseImage: Image(
                          image: const NetworkImage(
                            'https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149052117.jpg',
                          ),
                          width: size.width * 0.27,
                          height: size.height * 0.10,
                          fit: BoxFit.fill,
                        ),
                        courseMainText: 'Learn UI/UX For Beginner',
                        courseSecoundText: 'Sayed Ali',
                      ),
                    );
                  },
                  itemCount: 10,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: Colors.grey[200],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
