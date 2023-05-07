import 'package:flutter/material.dart';


class LoginSuccessScreen extends StatelessWidget {
  final String userId;

  const LoginSuccessScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Success'),
      ),
      body: Center(
        child: Text('Logged in with user ID: $userId'),
      ),
    );
  }
}
