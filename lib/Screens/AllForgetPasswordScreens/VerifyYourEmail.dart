import 'package:flutter/material.dart';

import 'package:odc_project/Screens/AllForgetPasswordScreens/CreateNewPassword.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/ForgetPasswordFormBuilder.dart';
import '../../Compounent/MyButton.dart';

class VerifyYourEmail extends StatelessWidget {
  VerifyYourEmail({Key? key}) : super(key: key);
  String screenText =
      'please enter the 4-digit code sent to ahmedabaza@gmail.com';
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secoundNumberController = TextEditingController();
  TextEditingController thirdNumberController = TextEditingController();
  TextEditingController fourthNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ForgetPasswordFormBuilder(
      appBarText: 'Verify Your Email',
      locationOfImage: 'assets/images/mail.svg',
      text: screenText,
      thirdCompounentOfScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: '_',
                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                border: InputBorder.none,
              ),
              // controller: ,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
              },
              controller: firstNumberController,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: '_',
                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                border: InputBorder.none,
              ),
              // controller: ,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
              },
              controller: secoundNumberController,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: '_',
                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                border: InputBorder.none,
              ),
              // controller: ,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
              },
              controller: thirdNumberController,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: '_',
                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                border: InputBorder.none,
              ),
              controller: fourthNumberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
              },
            ),
          ),
        ],
      ),
      customButton: MyButton(
        press: () {
          pushOnly(route: CreateNewPassword(), context: context);
        },
        buttonInLogInScreen: true,
        color: K_ORANGE_COLOR,
        textColor: K_WHITE_Color,
        text: 'Verify',
      ),
    );
  }
}
