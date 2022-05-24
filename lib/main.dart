import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';

import 'package:odc_project/Screens/SplashScreen/SplashScreen.dart';
import 'package:odc_project/Shared/CasheHelper.dart';

import 'Cubit/AppCubit/MyBlockObserver.dart';
import 'Network/Remote/DioHelper.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  DioHelper.initialize();

  bool onBoarding = CashHelper.getDate(key: 'onBoarding') ?? false;
  BlocOverrides.runZoned(
    blocObserver: MyBlocObserver(),
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => AppCubit(),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: K_WHITE_Color,
                appBarTheme: const AppBarTheme(
                  color: K_WHITE_Color,
                )),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        ),
      );
    },
  );
}
