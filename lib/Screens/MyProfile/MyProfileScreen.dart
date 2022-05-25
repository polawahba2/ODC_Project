import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Cubit/AppCubit/AppCubit.dart';
import 'package:odc_project/Models/UserProfileModel.dart';
import 'package:odc_project/Screens/LogIn/LogInScree.dart';
import 'package:odc_project/Shared/CasheHelper.dart';

import '../../Compounent/CourseImageAndInfoBuilder.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    'My Profile',
                    style: TextStyle(
                      color: K_ORANGE_COLOR,
                      fontSize: 30,
                      fontWeight: K_W600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      showLogOutDialog(context);
                    },
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 35,
                backgroundColor: K_ORANGE_COLOR,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    'https://i.guim.co.uk/img/media/1d554a94e069940467d47735238d1941e83e5877/0_611_3029_1818/master/3029.jpg?width=465&quality=45&auto=format&fit=max&dpr=2&s=667231b0d8d4615e437ba793da77f569',
                  ),
                ),
              ),
              Text(
                '${AppCubit.getCubit(context).userProfileModel!.data!.student!.studentName}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: K_W600,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${AppCubit.getCubit(context).userProfileModel!.data!.student!.email}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'My Achievement',
                  style: TextStyle(
                    color: K_BLACK_Color,
                    fontSize: 15.4,
                    fontWeight: K_W600,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: size.height * 0.57,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CourseImageAndInfoBuilder(
                          size: size,
                          courseImage: Image.asset(
                            'assets/images/myAchevementMedal.jpg',
                          ),
                          courseMainText: 'Learn UI/UX For Beginner',
                          courseSecoundText: 'chieved April 21 2022',
                        ),
                      );
                    },
                    itemCount: 11,
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        color: Colors.grey[200],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Exersice Name'),
          content: Image.asset('assets/images/logOutDialogImage.jpg'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                CashHelper.saveData(key: 'token', value: '');
                AppCubit.getCubit(context).bottomNavIndex = 0;
                pushReplacement(context: context, route: LogInScreen());
              },
              child: const Text('LogOut'),
            ),
          ],
        );
      },
    );
  }
}
