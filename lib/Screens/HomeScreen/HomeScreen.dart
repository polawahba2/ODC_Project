import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Compounent/Consts.dart';
import '../../Cubit/AppCubit/AppCubit.dart';
import '../../Cubit/AppCubit/AppStates.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  get textStyleCondition => null;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppSataes>(
      listener: (context, State) {},
      builder: (context, State) {
        return Scaffold(
          body: AppCubit.getCubit(context)
              .myScreens[AppCubit.getCubit(context).bottomNavIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: K_BLACK_Color,
                  ),
                  label: '.'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_book_outlined,
                    color: K_BLACK_Color,
                  ),
                  label: '.'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    color: K_BLACK_Color,
                  ),
                  label: '.'),
            ],
            currentIndex: AppCubit.getCubit(context).bottomNavIndex,
            selectedItemColor: K_ORANGE_COLOR,
            // showSelectedLabels: false,
            
            showUnselectedLabels: false,
            onTap: (index) {
              AppCubit.getCubit(context).changeBottomNavIndex(index);
            },
          ),
        );
      },
    );
  }
}
