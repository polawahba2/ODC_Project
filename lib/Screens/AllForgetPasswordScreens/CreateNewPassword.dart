import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Screens/HomeScreen/HomeScreen.dart';

import '../../Compounent/ForgetPasswordFormBuilder.dart';
import '../../Compounent/MyButton.dart';
import '../../Compounent/TextFieldContainer.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({Key? key}) : super(key: key);

  String screenText = 'Enter your new password';
  @override
  Widget build(BuildContext context) {
    return ForgetPasswordFormBuilder(
      appBarText: 'Create New Password',
      locationOfImage: 'assets/images/lockWithTrueSign.svg',
      text: screenText,
      thirdCompounentOfScreen: Column(
        children: [
          TextFieldContainer(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'New Password',
                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                border: InputBorder.none,
              ),
              // controller: ,
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Confirm password';
                }
              },
            ),
          ),
          TextFieldContainer(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'E-mail',
                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                border: InputBorder.none,
              ),
              // controller: ,
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'enter valid Email';
                }
              },
            ),
          ),
        ],
      ),
      customButton: MyButton(
        press: () {
          pushOnly(route: const HomeScreen(), context: context);
        },
        buttonInLogInScreen: true,
        color: K_ORANGE_COLOR,
        textColor: K_WHITE_Color,
        text: 'Submett',
      ),
    );
  }
}
