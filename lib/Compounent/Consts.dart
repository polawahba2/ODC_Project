// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

// ALL CONST VARRIABLES STARTS WITH K LETTER TO BE EASY TO FIND ;
const K_WHITE_Color = Colors.white;
const K_BLACK_Color = Colors.black;
const K_ORANGE_COLOR = Color.fromRGBO(255, 102, 0, 1);
const K_HOME_SCREEN_BLACK_COLOR = Color.fromRGBO(27, 24, 22, 1);

const K_W600 = FontWeight.w600;

const TextStyle K_SPLASH_SCREEN_ODC_TEXT_STYLE = TextStyle(
  color: K_BLACK_Color,
  fontSize: 25,
  fontWeight: FontWeight.w600,
);
const TextStyle K_LOGIN_SCREEN_ODC_TEXT_STYLE = TextStyle(
  color: K_BLACK_Color,
  fontSize: 10.9,
  fontWeight: FontWeight.w600,
);

const TextStyle K_FORGET_PASSWORD_TEXT_STYLE = TextStyle(
  color: K_BLACK_Color,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

const TextStyle K_HINT_TEXT_STYLE_SIGN_UP = TextStyle(
  color: Color.fromRGBO(208, 208, 208, 1),
  fontSize: 12.14,
  fontWeight: FontWeight.w500,
);

void pushOnly({required Widget route, required context}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void pushReplacement({required Widget route, required context}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}
