import 'package:dio/dio.dart';
import '../model/login_model.dart';

class LoginService {
  Future<MsUser> loginAPI(String username, String password) async {
    final dio = Dio();
    MsUser res = MsUser(
        statusCode: 0, email: '', password: password, username: username);
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
      res.statusCode = response.statusCode!;
      if (res.statusCode == 200) {
        res.token = response.data['token'];
      }
    } catch (e) {
      return MsUser(
          statusCode: 500,
          email: '',
          password: '',
          username: '',
          token: ""); // Login failed
      // throw Exception('Login Failed Error code > 500');
    }
    return res;
  }
}
