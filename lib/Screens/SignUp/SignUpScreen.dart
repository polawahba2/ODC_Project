import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Compounent/MyButton.dart';
import 'package:odc_project/Cubit/SignUpCubit/SignUpCubit.dart';
import 'package:odc_project/Cubit/SignUpCubit/SignUpStates.dart';
import 'package:odc_project/Screens/LogIn/LogInScree.dart';
import 'package:odc_project/Screens/LogIn/PrivacyPolicy.dart';

import '../../Compounent/TextFieldContainer.dart';
import '../../Shared/CasheHelper.dart';
import '../HomeScreen/HomeScreen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  var signUpFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSucessfulState) {
            CashHelper.saveData(
                    key: 'token', value: state.signUpModel.data!.accessToken)
                .then(
              (value) {
                if (value) {
                  pushReplacement(route: const HomeScreen(), context: context);
                }
              },
            );
            token = state.signUpModel.data!.accessToken!;
            print(token);
          }
        },
        builder: (context, state) {
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
                    key: signUpFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Hello,',
                                style: TextStyle(
                                  color: K_BLACK_Color,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Friend!',
                                style: TextStyle(
                                  color: K_ORANGE_COLOR,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Sign Up ',
                            style: TextStyle(
                              fontSize: 23.333,
                            ),
                          ),
                          TextFieldContainer(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person_outline,
                                  color: Colors.grey,
                                ),
                                hintText: 'full name',
                                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                                border: InputBorder.none,
                              ),
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter valid Email';
                                }
                              },
                            ),
                          ),
                          TextFieldContainer(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                ),
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
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                                hintText: 'Password',
                                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                                border: InputBorder.none,
                              ),
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter valid Email';
                                }
                              },
                            ),
                          ),
                          TextFieldContainer(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.phone_outlined,
                                  color: Colors.grey,
                                ),
                                hintText: 'Phone number',
                                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                                border: InputBorder.none,
                              ),
                              controller: phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter valid Email';
                                }
                              },
                            ),
                          ),
                          TextFieldContainer(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                ),
                                hintText: 'Adress',
                                hintStyle: K_HINT_TEXT_STYLE_SIGN_UP,
                                border: InputBorder.none,
                              ),
                              controller: adressController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 10) {
                                  return 'enter valid adress';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40.0,
                              top: 20,
                              bottom: 10,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Do you agree to our ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    pushOnly(
                                        route: const PrivacyPolicy(),
                                        context: context);
                                  },
                                  child: const Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                      color: K_ORANGE_COLOR,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MyButton(
                            buttonInLogInScreen: true,
                            color: K_ORANGE_COLOR,
                            textColor: K_WHITE_Color,
                            text: 'Sign Up',
                            press: () {
                              if (signUpFormKey.currentState!.validate()) {
                                SignUpCubit.getCubit(context).userSignUp(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  address: adressController.text,
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an accound? ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    pushReplacement(
                                        route: LogInScreen(), context: context);
                                  },
                                  child: const Text(
                                    'Login',
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
        },
      ),
    );
  }
}
