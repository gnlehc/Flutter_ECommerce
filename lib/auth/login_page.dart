import 'package:flutter/material.dart';
import 'package:trainingassignment/navbar.dart';

class Login extends StatelessWidget {
  // final bool isLoggedIn;
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F6799),
      appBar: const PreferredSize(
        preferredSize: Size(100, 50),
        child: Navbar()
      ),
      body: Center(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
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
                        const Color(0xFFF18700)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/',
                        arguments: {'userToken': 'testing' }
                        // '/login/${user}'
                        );
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
                        children: const <Widget>[
                          Text(
                            '© 2022 BINUSMART',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


















// class Login extends StatelessWidget {
//   const Login({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF2F6799),
//       appBar: const PreferredSize(
//         preferredSize: Size(100, 50),
//         child: Navbar(),
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.only(top: 40),
//           width: 500,
//           height: 450,
//           alignment: Alignment.topCenter,
//           color: Colors.white,
//           child: const Text(
//             "Login",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//           ),
//         ),
//       ),
//     );
//   }
// }
