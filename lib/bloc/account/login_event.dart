abstract class LoginPageEvent {
  const LoginPageEvent();
}

class FetchUserAccount extends LoginPageEvent {
  final String email;
  final String password;

  FetchUserAccount({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [];
}

class ScreenArguments {
  late String username;
  late int? userId;
  ScreenArguments({required this.username, this.userId});
}
