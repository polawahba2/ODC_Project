import 'package:flutter/material.dart';
import 'package:odc_project/Screens/CourseDetails.dart/CourseDetailsScreen.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/CourseImageAndInfoBuilder.dart';

class CourseInformations extends StatelessWidget {
  const CourseInformations({Key? key}) : super(key: key);

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
                              route: CourseDetailsScreen(), context: context);
                        },
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
                      ),
                    );
                  },
                  itemCount: 4,
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
