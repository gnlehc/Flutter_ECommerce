abstract class LoginPageState {
  const LoginPageState();
  List<Object> get props => [];

  get temp => null;
}

// MsUser
class LoginPageInitial extends LoginPageState {}

class LoginPageLoading extends LoginPageState {}

class LoginPageHasData extends LoginPageState {
  final String email;
  final String password;
  final String username;
  final String token;
  final int retcode;

  const LoginPageHasData(
      this.email, this.password, this.username, this.token, this.retcode);

  @override
  List<Object> get props => [email, password, username, token, retcode];
}

class LoginPageHasError extends LoginPageState {
  final String errMessage;

  const LoginPageHasError(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
