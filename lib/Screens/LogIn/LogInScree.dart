import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Compounent/LogoAndTextBuilder.dart';
import 'package:odc_project/Cubit/LogInCubit/LogInCubit.dart';
import 'package:odc_project/Cubit/LogInCubit/LogInStates.dart';
import 'package:odc_project/Screens/HomeScreen/HomeScreen.dart';
import 'package:odc_project/Screens/LogIn/PrivacyPolicy.dart';
import 'package:odc_project/Screens/SignUp/SignUpScreen.dart';

import '../../Compounent/Consts.dart';
import '../../Compounent/MyButton.dart';
import '../../Compounent/TextFieldContainer.dart';
import '../../Shared/CasheHelper.dart';
import '../AllForgetPasswordScreens/ForgetPasswordScreen.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  var logInFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: BlocConsumer<LogInCubit, LogInStates>(listener: (context, state) {
        if (state is LogInSucessfulState) {
          pushReplacement(route: const HomeScreen(), context: context);
          CashHelper.saveData(
              key: 'token', value: state.logInModel.data!.accessToken);
          token = state.logInModel.data!.accessToken!;

          print(token);
        }
      }, builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Form(
                  key: logInFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LogoAndTextBuilder(isInSplashScreen: false),
                        SizedBox(
                          height: size.height * 0.135,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Welome ',
                              style: TextStyle(
                                color: K_BLACK_Color,
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Back!',
                              style: TextStyle(
                                color: K_ORANGE_COLOR,
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        TextFieldContainer(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'E-mail',
                              hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                              border: InputBorder.none,
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@')) {
                                return 'enter valid Email';
                              }
                            },
                          ),
                        ),
                        TextFieldContainer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              ),
                              hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                              border: InputBorder.none,
                            ),
                            controller: passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter valid password';
                              }
                            },
                            onFieldSubmitted: (value) {
                              if (logInFormKey.currentState!.validate()) {
                                LogInCubit.getCubit(context).userLogIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40.0,
                            bottom: 35,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: InkWell(
                              onTap: () {
                                pushOnly(
                                    route: ForgetPasswordScreen(),
                                    context: context);
                              },
                              child: const Text(
                                'Forget Password',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  color: K_ORANGE_COLOR,
                                ),
                              ),
                            ),
                          ),
                        ),
                        MyButton(
                          buttonInLogInScreen: true,
                          color: K_ORANGE_COLOR,
                          textColor: K_WHITE_Color,
                          text: 'Login',
                          press: () {
                            if (logInFormKey.currentState!.validate()) {
                              LogInCubit.getCubit(context).userLogIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Dont have an account ? ',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pushReplacement(
                                      route: SignUpScreen(), context: context);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: K_ORANGE_COLOR,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
