import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/Consts.dart';

class LogoAndTextBuilder extends StatelessWidget {
  bool isInSplashScreen;
  LogoAndTextBuilder({Key? key, this.isInSplashScreen = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyleCondition = isInSplashScreen
        ? K_SPLASH_SCREEN_ODC_TEXT_STYLE
        : K_LOGIN_SCREEN_ODC_TEXT_STYLE;
    var size = MediaQuery.of(context).size;
    return Container(
      height: isInSplashScreen ? size.height * 0.125 : size.height * 0.066,
      width: isInSplashScreen ? size.width * 0.525 : size.width * 0.4,
      color: K_WHITE_Color,
      child: Row(
        children: [
          Image.asset('assets/images/OrangeLogo.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Orange',
                style: textStyleCondition,
              ),
              Text(
                'Digital',
                style: textStyleCondition,
              ),
              Text(
                'Center',
                style: textStyleCondition,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
