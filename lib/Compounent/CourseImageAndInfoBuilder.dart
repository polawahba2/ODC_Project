import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';

class CourseImageAndInfoBuilder extends StatelessWidget {
  String courseMainText;
  String courseSecoundText;
  Image courseImage;

  CourseImageAndInfoBuilder({
    required this.courseMainText,
    required this.courseSecoundText,
    required this.courseImage,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        courseImage,
        // Image(
        //   image: courseImage,
        //   width: size.width * 0.27,
        //   height: size.height * 0.10,
        //   fit: BoxFit.fill,
        // ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseMainText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: K_W600,
              ),
            ),
            Text(
              courseSecoundText,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
