import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/Cubit/SignUpCubit/SignUpStates.dart';
import 'package:odc_project/Models/SignUpModel.dart';
import 'package:odc_project/Network/EndPoints/EndPoints.dart';

import '../../Network/Remote/DioHelper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());

  static SignUpCubit getCubit(context) {
    return BlocProvider.of(context);
  }

  late SignUpModel signUpModel;

  void userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'address': address,
      },
    ).then((value) {
      signUpModel = SignUpModel.fromJson(value.data);
      emit(SignUpSucessfulState(signUpModel));
    }).catchError((error) {
      print(error.toString());
      emit(SignUpErrorState(error.toString()));
    });
  }
}
