import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/ForgetPasswordFormBuilder.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/MyButton.dart';

class ExamScreenBuilder extends StatelessWidget {
  String firstImageUrl;
  String secoundImageUrl;
  String textOne;
  String buttonText;
  String appBarText;
  Widget thirdCompounent;
  VoidCallback press;

  ExamScreenBuilder({
    Key? key,
    required this.firstImageUrl,
    required this.secoundImageUrl,
    required this.textOne,
    required this.appBarText,
    required this.thirdCompounent,
    required this.press,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ForgetPasswordFormBuilder(
      locationOfImage: firstImageUrl,
      appBarText: appBarText,
      text: textOne,
      customButton: MyButton(
        text: buttonText,
        color: K_WHITE_Color,
        boarderColor: K_ORANGE_COLOR,
        textColor: K_ORANGE_COLOR,
        buttonInLogInScreen: true,
        press: press,
      ),
      thirdCompounentOfScreen: thirdCompounent,
    );
  }
}
