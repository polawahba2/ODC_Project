import 'package:odc_project/Models/LogInModel.dart';

abstract class LogInStates {}

class InitialState extends LogInStates {}

class LogInLoadingState extends LogInStates {}

class LogInSucessfulState extends LogInStates {
  LogInModel logInModel;
  LogInSucessfulState(this.logInModel);
}

class LogInErrorState extends LogInStates {
  final String ERROR;
  LogInErrorState(this.ERROR);
}
