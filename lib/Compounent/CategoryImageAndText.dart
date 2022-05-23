import 'package:flutter/material.dart';

import 'Consts.dart';

class CategoryImageAndText extends StatelessWidget {
  String text;
  double textSize;
  CategoryImageAndText({
    required this.text,
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
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://banner2.cleanpng.com/20180808/uby/kisspng-website-development-vector-graphics-clip-art-world-cc2u-ru-%D0%92%D0%BE%D0%B4%D0%B8%D1%82%D0%B5%D0%BB%D1%8C-%E5%85%8D-%E8%B2%BB-%E7%8E%A9-%E4%BA%A4-%E9%80%9A-%E9%81%8B-5b6afbdd58d8f6.3221542915337379493639.jpg',
                  ),
                  fit: BoxFit.contain,
                ),
                color: K_WHITE_Color,
              ),
              height: size.height * 0.088,
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
