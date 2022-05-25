import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Compounent/Consts.dart';
import 'package:odc_project/Models/AllCoursesModel.dart';
import 'package:odc_project/Models/CourseByItsId.dart';
import 'package:odc_project/Models/CoursesByCategoryId.dart';
import 'package:odc_project/Models/UserProfileModel.dart';
import 'package:odc_project/Screens/HomeScreen/HomeScreenBody.dart';
import 'package:odc_project/Screens/MyCourses/MyCoursesScreen.dart';
import 'package:odc_project/Screens/MyProfile/MyProfileScreen.dart';

import '../../Models/CategoriesModel.dart';
import '../../Network/EndPoints/EndPoints.dart';
import '../../Network/Remote/DioHelper.dart';
import 'AppStates.dart';

class AppCubit extends Cubit<AppSataes> {
  AppCubit() : super(InitialState());

  // late CategoriesModel categoriesModel;
  CategoriesModel? categoriesModel;
  AllCoursesModel? allCoursesModel;
  CourseByItsIdModel? courseByItsIdModel;
  CoursesByCategoryId? coursesByCategoryId;
  UserProfileModel? userProfileModel;
  String? OTPmessage;
  String uEmail = '';
  String otp = '';

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

  void getCategories() {
    emit(GetAllCategoriesLoadingState());

    DioHelper.getData(
      url: CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value!.data);

      print(categoriesModel!.message);
      emit(GetAllCategoriesSucessfulState(categoriesModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetAllCategoriesErrorState(error.toString()));
    });
  }

  void getAllCourses() {
    emit(GetAllCoursesLoadingState());

    DioHelper.getData(
      url: ALLCOURSES,
      token: token,
    ).then((value) {
      allCoursesModel = AllCoursesModel.fromJson(value!.data);
      emit(GetAllCoursesSucessfulState(allCoursesModel!));
    }).catchError((error) {
      emit(GetAllCoursesErrorState(error.toString()));
    });
  }

  void getCourseByItsId(int id) {
    emit(GetCourseByItsIdLoadingState());

    DioHelper.getData(
      url: '/categories/$id',
      token: token,
    ).then((value) {
      // print("$value---------------------");
      courseByItsIdModel = CourseByItsIdModel.fromJson(value!.data);

      emit(GetCourseByItsIdSucessfulState(courseByItsIdModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetCourseByItsIdErrorState(error.toString()));
    });
  }

  void getCourseByCategoryId(int id) {
    emit(GetCourseByCategoryIdLoadingState());

    DioHelper.getData(
      url: '/categories/$id/courses',
      token: token,
    ).then((value) {
      // print("$value---------------------");
      coursesByCategoryId = CoursesByCategoryId.fromJson(value!.data);

      print(coursesByCategoryId!.data!.categoryName);
      print(coursesByCategoryId!.data!.courses![0].imageUrl);
      print('><<><<<><><<>');
      emit(GetCourseByCategoryIdSucessfulState(coursesByCategoryId!));
    }).catchError((error) {
      print(error.toString());
      emit(GetCourseByCategoryIdErrorState(error.toString()));
    });
  }

  void getUserProfile() {
    emit(GetUserProfileLoadingState());

    DioHelper.getData(
      url: ME,
      token: token,
    ).then((value) {
      userProfileModel = UserProfileModel.fromJson(value!.data);

      print(userProfileModel!.message);
      emit(GetUserProfileSucessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserProfileErrorState(error.toString()));
    });
  }

  void postEmailToResetPassword({
    required String email,
  }) {
    emit(PostEmailToResetPasswordLoadingState());
    DioHelper.postData(
      url: RESETPASSWORD,
      data: {
        'email': email,
      },
    ).then((value) {
      uEmail = email;
      emit(PostEmailToResetPasswordSucessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(PostEmailToResetPasswordErrorState(error.toString()));
    });
  }

  void postEmailToResetPasswordStep2({
    required int n1,
    required int n2,
    required int n3,
    required int n4,
  }) {
    emit(PostEmailToResetPasswordLoadingState());
    DioHelper.postData(
      url: RESETPASSWORDStep2,
      data: {
        'email': uEmail,
        'otp': '$n1$n2$n3$n4',
      },
    ).then((value) {
      otp = '$n1$n2$n3$n4';
      OTPmessage = value.data.message;
      emit(PostEmailToResetPasswordSucessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(PostEmailToResetPasswordErrorState(error.toString()));
    });
  }

  void postEmailToResetPasswordStep3({
    required String password,
  }) {
    emit(PostEmailToResetPasswordLoadingState());
    DioHelper.postData(
      url: RESETPASSWORDStep2,
      data: {
        'email': uEmail,
        'otp': otp,
        "password": password,
      },
    ).then((value) {
      OTPmessage = value.data.message;
      print(OTPmessage);
      emit(PostEmailToResetPasswordSucessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(PostEmailToResetPasswordErrorState(error.toString()));
    });
  }
}
