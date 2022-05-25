import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/ForgetPasswordFormBuilder.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';
import 'package:odc_project/Screens/AllForgetPasswordScreens/VerifyYourEmail.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/MyButton.dart';
import '../../Compounent/TextFieldContainer.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  String screenText =
      'Please enter your email address to recieve vervication code ';
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ForgetPasswordFormBuilder(
      appBarText: 'Forget Password',
      locationOfImage: 'assets/images/lockWithQuestionMark.svg',
      text: screenText,
      thirdCompounentOfScreen: TextFieldContainer(
        child: TextFormField(
          controller: emailController,
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
      customButton: MyButton(
        press: () {
          AppCubit.getCubit(context)
              .postEmailToResetPassword(email: emailController.text);
          pushOnly(route: VerifyYourEmail(), context: context);
        },
        buttonInLogInScreen: true,
        color: K_ORANGE_COLOR,
        textColor: K_WHITE_Color,
        text: 'Send',
      ),
    );
  }
}
