import 'package:odc_project/Models/CategoriesModel.dart';
import 'package:odc_project/Models/CourseByItsId.dart';
import 'package:odc_project/Models/CoursesByCategoryId.dart';

import '../../Models/AllCoursesModel.dart';

abstract class AppSataes {}

class InitialState extends AppSataes {}

class BottomNavBarChangingIndex extends AppSataes {}

class GetAllCategoriesLoadingState extends AppSataes {}

class GetAllCategoriesSucessfulState extends AppSataes {
  CategoriesModel categoriesModel;
  GetAllCategoriesSucessfulState(this.categoriesModel);
}

class GetAllCategoriesErrorState extends AppSataes {
  final String Error;
  GetAllCategoriesErrorState(this.Error);
}

class GetAllCoursesLoadingState extends AppSataes {}

class GetAllCoursesSucessfulState extends AppSataes {
  AllCoursesModel coursesModel;
  GetAllCoursesSucessfulState(this.coursesModel);
}

class GetAllCoursesErrorState extends AppSataes {
  final String Error;
  GetAllCoursesErrorState(this.Error);
}

class GetCourseByItsIdLoadingState extends AppSataes {}

class GetCourseByItsIdSucessfulState extends AppSataes {
  CourseByItsIdModel courseByItsIdModel;
  GetCourseByItsIdSucessfulState(this.courseByItsIdModel);
}

class GetCourseByItsIdErrorState extends AppSataes {
  final String Error;
  GetCourseByItsIdErrorState(this.Error);
}

class GetCourseByCategoryIdLoadingState extends AppSataes {}

class GetCourseByCategoryIdSucessfulState extends AppSataes {
  CoursesByCategoryId coursesByCategoryId;
  GetCourseByCategoryIdSucessfulState(this.coursesByCategoryId);
}

class GetCourseByCategoryIdErrorState extends AppSataes {
  final String Error;
  GetCourseByCategoryIdErrorState(this.Error);
}

class GetUserProfileLoadingState extends AppSataes {}

class GetUserProfileSucessfulState extends AppSataes {}

class GetUserProfileErrorState extends AppSataes {
  final String Error;
  GetUserProfileErrorState(this.Error);
}

class PostEmailToResetPasswordLoadingState extends AppSataes {}

class PostEmailToResetPasswordSucessfulState extends AppSataes {}

class PostEmailToResetPasswordErrorState extends AppSataes {
  final String Error;
  PostEmailToResetPasswordErrorState(this.Error);
}
