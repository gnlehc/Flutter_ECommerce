import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/bloc/account/login_bloc.dart';
import 'package:trainingassignment/bloc/account/login_state.dart';
import 'package:trainingassignment/navbar.dart';

import '../bloc/account/login_event.dart';

class Login extends StatelessWidget {
  final LoginBloc loginbloc = LoginBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginPageState>(
        listener: (context, state) {
          // print("retcode ${state.retcode}");
          if (state is LoginPageHasData) {
            // print("Login Success");
            Navigator.pushNamed(context, '/',
                arguments: ScreenArguments(
                  username: state.username,
                ));
          } else if (state is LoginPageHasError) {
            // print("Login Failed");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login failed')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF2F6799),
            appBar: PreferredSize(
              preferredSize: const Size(100, 50),
              child: Navbar(),
            ),
            body: Form(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 500,
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: (state is LoginPageHasError)
                              ? Border.all(
                                  color: const Color(0xFFD50606), width: 2)
                              : null,
                          color: Colors.grey[300],
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: (state is LoginPageHasError)
                              ? Border.all(
                                  color: const Color(0xFFD50606), width: 2)
                              : null,
                          color: Colors.grey[300],
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      if (state is LoginPageHasError)
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text(
                              'Email or Password is invalid',
                              style: TextStyle(
                                color: Color(0xFFD50606),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFF18700),
                            ),
                          ),
                          onPressed: () {
                            final loginBloc =
                                BlocProvider.of<LoginBloc>(context);
                            print("Login button was pressed");
                            loginBloc.add(
                              FetchUserAccount(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );

                            _emailController.clear();
                            _passwordController.clear();
                          },
                          child: const Text('Login'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  '© 2022 BINUSMART',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
