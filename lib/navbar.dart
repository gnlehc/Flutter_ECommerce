import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainingassignment/auth/login_page.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: GestureDetector(
        onTap: () {
          // add your redirection code here
          Navigator.pushNamed(context, '/');
        },
        child: RichText(
          text: TextSpan(
            text: 'BINUS',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            children: <InlineSpan>[
              const TextSpan(
                text: 'MART',
                style: TextStyle(
                  color: Color(0xFFF18700),
                ),
              ),
              const WidgetSpan(child: SizedBox(width: 200)),
              TextSpan(
                text: 'Category',
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(150, 65, 64, 66),
                  fontSize: 18,
                ),
              ),
              const WidgetSpan(child: SizedBox(width: 50)),
              TextSpan(
                text: 'Cart',
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(150, 65, 64, 66),
                  fontSize: 18,
                ),
              ),
              const WidgetSpan(child: SizedBox(width: 800)),
              TextSpan(
                text: 'Login',
                style: GoogleFonts.inter(
                  color: const Color(0xFFF18700),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, '/Login');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavbarLog extends StatelessWidget {
  final bool isLoggedIn;
  const NavbarLog({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: GestureDetector(
        onTap: () {
          // add your redirection code here
          Navigator.pushNamed(context, '/');
        },
        child: RichText(
          text: TextSpan(
            text: 'BINUS',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            children: <InlineSpan>[
              const TextSpan(
                text: 'MART',
                style: TextStyle(
                  color: Color(0xFFF18700),
                ),
              ),
              const WidgetSpan(child: SizedBox(width: 200)),
              TextSpan(
                text: 'Category',
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(150, 65, 64, 66),
                  fontSize: 18,
                ),
              ),
              const WidgetSpan(child: SizedBox(width: 50)),
              TextSpan(
                text: 'Cart',
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(150, 65, 64, 66),
                  fontSize: 18,
                ),
              ),
              const WidgetSpan(child: SizedBox(width: 800)),
              TextSpan(
                text: 'Username',
                style: GoogleFonts.inter(
                  color: const Color(0xFFF18700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
