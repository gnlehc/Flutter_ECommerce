class MsUser {
  String email;
  String username;
  String password;
  int statusCode;
  String? token;
  MsUser(
      {required this.email,
      required this.username,
      required this.password,
      required this.statusCode,
      this.token});
}
