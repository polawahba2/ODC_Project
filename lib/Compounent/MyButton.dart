import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback? press;
  Color color;
  Color boarderColor;
  var textColor = Colors.white;
  bool buttonInLogInScreen;

  MyButton({
    Key? key,
    this.text = 'LogIg',
    this.press,
    this.color = Colors.blue,
    this.boarderColor = Colors.white,
    this.textColor = Colors.white,
    this.buttonInLogInScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: !buttonInLogInScreen ? size.height * 0.06 : size.height * 0.075,
      width: !buttonInLogInScreen ? size.width * 0.40 : size.width * 0.9,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: boarderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        onPressed: press,
        elevation: 0,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
