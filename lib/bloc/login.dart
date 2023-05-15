// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../fetch/model.dart';

// class LoginBloc extends Bloc<LoginToken, LoginModel> {
//   LoginBloc() : super(LoginModel(email: "", password: "", username: "")) {
//     on<LoginToken>((event, emit) async {
//       var temp = LoginModel(
//         email: state.email,
//         password: state.password,
//         token: state.token,
//         username: state.username,
//       );
//       if (event is LoginToken) {
//         try {
//           var res = await loginAPI(temp.email, temp.password);
//           temp.retcode = res.retcode;
//           temp.token = res.token;
//           temp.username = res.username;
//         } catch (e) {
//           temp.retcode = 500;
//         } finally {
//           emit(temp);
//         }
//       }
//     });
//   }
// }

// Future<LoginModel> loginAPI(String email, String password) async {
//   final dio = Dio();
//   try {
//     Response response = await dio.post(
//       "https://fakestoreapi.com/auth/login",
//       data: {
//         "email": email,
//         "password": password,
//       },
//       options: Options(
//         validateStatus: (status) {
//           return status! < 500;
//         },
//       ),
//     );
//     if (response.statusCode == 200) {
//       return LoginModel(
//         email: email,
//         password: password,
//         username: response.data['username'],
//         token: response.data['token'],
//         retcode: response.statusCode!,
//       );
//     } else {
//       throw Exception('Login Failed else');
//     }
//   } catch (e) {
//     throw Exception('Login Failed');
//   }
// }

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

// Future<LoginModel> loginAPI(String email, String password) async {
//   final dio = Dio();
//   try {
//     Response response = await dio.post(
//       "https://fakestoreapi.com/auth/login",
//       data: {
//         "u": email,
//         "password": password,
//       },
//       options: Options(
//         validateStatus: (status) {
//           return status! < 500;
//         },
//         // contentType: Headers.jsonContentType,
//       ),
//     );
//     print(response.data);
//     if (response.statusCode == 200) {
//       return LoginModel(
//         email: email,
//         password: password,
//         username: response.data['username'],
//         token: response.data['token'],
//         retcode: response.statusCode!,
//       );
//     } else {
//       throw Exception('Login Failed else');
//     }
//   } catch (e) {
//     throw Exception('Login Failed');
//   }
// }

Future<LoginModel> loginAPI(String username, String password) async {
  final dio = Dio();
  bool isLoggedIn = false;
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
      isLoggedIn = true;
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


// Future<LoginModel> loginAPI(String email, String password) async {
//   final dio = Dio();
//   try {
//     Response response = await dio.post(
//       "https://fakestoreapi.com/auth/login",
//       data: {
//         "email": email,
//         "password": password,
//       },
//     );
//     if (response.statusCode == 200) {
//       return LoginModel(
//         email: email,
//         password: password,
//         username: response.data['email'],
//         token: response.data['token'],
//         retcode: response.statusCode!,
//       );
//     } else {
//       throw Exception('Login Failed (email or password wrong)');
//     }
//   } catch (e) {
//     throw Exception('Login Failed');
//   }
// }