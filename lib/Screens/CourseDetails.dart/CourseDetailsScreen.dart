import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Compounent/MyButton.dart';

import '../../Compounent/CourseImageAndInfoBuilder.dart';

class CourseDetailsScreen extends StatelessWidget {
  CourseDetailsScreen({Key? key}) : super(key: key);
  String text =
      "Welcome to your UX Design for Beginners Course. In the following tutorials, you'll get a thorough introduction to UX design, from its definition, areas and origins through to the skills you need to build a professional portfolio and become a UX designer. ";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.3,
                child: const Image(
                  width: double.infinity,
                  image: NetworkImage(
                    'https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149052117.jpg',
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.topCenter,
                child: Text(
                  'Learn UI/UX for Beginners',
                  style: TextStyle(
                    color: K_BLACK_Color,
                    fontSize: 22,
                    fontWeight: K_W600,
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.topCenter,
                child: Text(
                  'Author : Ahmed Abaza',
                  style: TextStyle(
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
                children: const [
                  Icon(Icons.signal_cellular_alt, color: K_ORANGE_COLOR),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Beginner level ',
                    style: TextStyle(
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
              SizedBox(
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
              SizedBox(
                height: size.height * 0.1,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CourseImageAndInfoBuilder(
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
