import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Consts.dart';

class ForgetPasswordFormBuilder extends StatelessWidget {
  String locationOfImage;
  String text;
  Widget thirdCompounentOfScreen;
  Widget customButton;
  String appBarText;

  ForgetPasswordFormBuilder({
    Key? key,
    required this.locationOfImage,
    required this.text,
    required this.thirdCompounentOfScreen,
    required this.customButton,
    required this.appBarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarText,
          style: const TextStyle(
            color: K_BLACK_Color,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: K_BLACK_Color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: size.height * 0.045,
                ),
                SvgPicture.asset(
                  locationOfImage,
                  height: size.height * 0.2,
                  width: size.width * 0.04,
                ),
                SizedBox(
                  height: size.height * 0.022,
                ),
                Text(
                  text,
                  style: K_FORGET_PASSWORD_TEXT_STYLE,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                thirdCompounentOfScreen,
                SizedBox(
                  height: size.height * 0.022,
                ),
                customButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
