import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Screens/HomeScreen/HomeScreen.dart';
import 'package:odc_project/Screens/HomeScreen/HomeScreenBody.dart';
import 'package:odc_project/Screens/MyCourses/MyCoursesScreen.dart';
import 'package:odc_project/Screens/MyProfile/MyProfileScreen.dart';

import 'AppStates.dart';

class AppCubit extends Cubit<AppSataes> {
  AppCubit() : super(InitialState());

  List<Widget> myScreens = const [
    HomeScreenBody(),
    MyCoursesScreen(),
    MyProfileScreen(),
  ];
  int bottomNavIndex = 0;

  void changeBottomNavIndex(int index) {
    emit(BottomNavBarChangingIndex());
    bottomNavIndex = index;
  }

  static AppCubit getCubit(context) {
    return BlocProvider.of(context);
  }
}
