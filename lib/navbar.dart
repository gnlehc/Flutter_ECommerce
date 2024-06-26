import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/account/login_event.dart';
import 'model/login_model.dart';
import 'routes/router.dart';

class Navbar extends StatelessWidget {
  late String username;
  Navbar({Key? key, this.username = ""});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // textTheme: GoogleFonts.interTextTheme(),
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Text(
          //   'BINUS',
          //   style: GoogleFonts.inter(
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20,
          //   ),
          // ),
          // Text(
          //   'MART',
          //   style: GoogleFonts.inter(
          //     color: const Color(0xFFF18700),
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20,
          //   ),
          // ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/',
                  arguments: ScreenArguments(username: username));
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero)),
            child: Text(
              'BINUS',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                wordSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/',
                  arguments: ScreenArguments(username: username));
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero)),
            child: Text(
              'MART',
              style: GoogleFonts.inter(
                color: const Color(0xFFF18700),
                fontSize: 18,
                wordSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // const Spacer(),
          const SizedBox(width: 80),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/category',
                  arguments: ScreenArguments(username: username));
            },
            child: Text(
              'Category',
              style: GoogleFonts.inter(
                color: const Color.fromARGB(150, 65, 64, 66),
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart',
                  arguments: ScreenArguments(username: username));
            },
            child: Text(
              'Cart',
              style: GoogleFonts.inter(
                color: const Color.fromARGB(150, 65, 64, 66),
                fontSize: 18,
              ),
            ),
          ),
          const Spacer(),
          username.isEmpty
              ? TextButton(
                  onPressed: () {
                    Application.router.navigateTo(context, '/login');
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFF18700),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              : Text(
                  'Hi $username!',
                  style: GoogleFonts.inter(
                    color: const Color(0xFFF18700),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
        ],
      ),
    );
  }
}

class NavbarLog extends StatelessWidget {
  final MsUser username;
  const NavbarLog({Key? key, required this.username});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // textTheme: GoogleFonts.interTextTheme(),
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text(
            'BINUS',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'MART',
            style: GoogleFonts.inter(
              color: const Color(0xFFF18700),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          _buildNavButton(
            context: context,
            route: '/Category',
            title: 'Category',
          ),
          _buildNavButton(
            context: context,
            route: '/Cart',
            title: 'Cart',
          ),
          const Spacer(),
          Text(
            'Hi $username!',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required String route,
    required String title,
  }) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        title,
        style: GoogleFonts.inter(
          color: const Color.fromARGB(150, 65, 64, 66),
          fontSize: 18,
        ),
      ),
    );
  }
}
