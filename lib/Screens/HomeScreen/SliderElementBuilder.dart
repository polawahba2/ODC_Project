import 'package:flutter/material.dart';

import '../../Compounent/Consts.dart';

class SliderElementBuilder extends StatelessWidget {
  String courseName;
  String courseDetails;
  String courseInstructor;
  String imageUrl;
  SliderElementBuilder({
    required this.courseName,
    required this.courseInstructor,
    required this.courseDetails,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.320,
      width: size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            courseName,
            style: const TextStyle(
              fontSize: 9.0,
              color: K_ORANGE_COLOR,
            ),
          ),
          Text(
            courseDetails,
            style: const TextStyle(
              fontSize: 20.0,
              color: K_BLACK_Color,
              fontWeight: K_W600,
            ),
          ),
          Text(
            courseInstructor,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
