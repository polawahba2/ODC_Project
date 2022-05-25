import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';
import 'package:odc_project/Screens/HomeScreen/HomeScreen.dart';
import 'package:odc_project/Screens/LogIn/LogInScree.dart';

import '../../Compounent/ForgetPasswordFormBuilder.dart';
import '../../Compounent/MyButton.dart';
import '../../Compounent/TextFieldContainer.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
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
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm password';
                }
              },
            ),
          ),
          TextFieldContainer(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'confirm ',
                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                border: InputBorder.none,
              ),
              controller: confirmpasswordController,
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
          if (passwordController.text == confirmpasswordController.text &&
              passwordController.text.isNotEmpty) {
            AppCubit.getCubit(context).postEmailToResetPasswordStep3(
                password: passwordController.text);
            pushOnly(route: LogInScreen(), context: context);
          }
        },
        buttonInLogInScreen: true,
        color: K_ORANGE_COLOR,
        textColor: K_WHITE_Color,
        text: 'Submett',
      ),
    );
  }
}
