import 'package:flutter/material.dart';

import 'Consts.dart';

class CategoryImageAndText extends StatelessWidget {
  String text;
  double textSize;
  String imageUrl;
  CategoryImageAndText({
    required this.text,
    required this.imageUrl,
    this.textSize = 10.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Material(
            elevation: 3,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.none,
                ),
                color: K_WHITE_Color,
              ),
              height: size.height * 0.075,
              width: size.width * 0.20,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            width: size.width * 0.25,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
