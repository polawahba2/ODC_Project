import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Cubit/LogInCubit/LogInStates.dart';
import 'package:odc_project/Models/LogInModel.dart';
import 'package:odc_project/Network/Remote/DioHelper.dart';

import '../../Network/EndPoints/EndPoints.dart';

class LogInCubit extends Cubit<LogInStates> {
  LogInCubit() : super(InitialState());

  static LogInCubit getCubit(context) {
    return BlocProvider.of(context);
  }

  late LogInModel logInModel;
  void userLogIn({
    required String email,
    required String password,
  }) {
    emit(LogInLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      logInModel = LogInModel.fromJson(value.data);
      // print(logInModel.message);
      // print('user token is${logInModel.data!.accessToken}');
      emit(LogInSucessfulState(logInModel));
    }).catchError((error) {
      print(error.toString());
      emit(LogInErrorState(error.toString()));
    });
  }
}
