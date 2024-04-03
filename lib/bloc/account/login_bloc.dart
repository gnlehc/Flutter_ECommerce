import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/bloc/account/login_event.dart';
import 'package:trainingassignment/bloc/account/login_state.dart';
import 'package:trainingassignment/service/login_service.dart';

class LoginBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginService loginService = LoginService();
  LoginBloc() : super(LoginPageInitial()) {
    on<FetchUserAccount>((event, emit) async {
      try {
        emit(LoginPageLoading());
        var res = await loginService.loginAPI(event.email, event.password);
        emit(LoginPageHasData(
            res.email, res.password, res.username, res.token!, res.statusCode));
      } on DioError catch (e) {
        emit(LoginPageHasError(e.response.toString())); // Login failed
      }
    });
  }
}
