import '../../Models/SignUpModel.dart';

abstract class SignUpStates {}

class InitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSucessfulState extends SignUpStates {
  SignUpModel signUpModel;
  SignUpSucessfulState(this.signUpModel);
}

class SignUpErrorState extends SignUpStates {
  final String ERROR;
  SignUpErrorState(this.ERROR);
}
