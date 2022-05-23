import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';

import '../../Compounent/CourseImageAndInfoBuilder.dart';

class NewCoursesScreen extends StatelessWidget {
  const NewCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Web Development',
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
                  itemCount: 17,
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
