import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../fetch/model.dart';

class LoginBloc extends Bloc<LoginToken, LoginModel> {
  LoginBloc() : super(LoginModel(email: "", password: "", username: "")) {
    on<LoginToken>((event, emit) async {
      if (event is LoginToken) {
        try {
          var res = await loginAPI(event.email, event.password);
          emit(res);
        } catch (e) {
          emit(LoginModel(
              retcode: 500,
              email: '',
              password: '',
              username: '')); // Login failed
        }
      }
    });
  }
}

Future<LoginModel> loginAPI(String username, String password) async {
  final dio = Dio();
  LoginModel res = LoginModel(
      retcode: 0,
      email: '',
      password: password,
      username: username); // Login failed
  try {
    Response response = await dio.post(
      "https://fakestoreapi.com/auth/login",
      data: {
        "username": username,
        "password": password,
      },
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
        // contentType: Headers.jsonContentType,
      ),
    );
    res.retcode = response.statusCode!;
    if (res.retcode == 200) {
      res.token = response.data['token'];
    }
  } catch (e) {
    return LoginModel(
        retcode: 500,
        email: '',
        password: '',
        username: '',
        token: ""); // Login failed
    // throw Exception('Login Failed Error code > 500');
  }
  return res;
}
