import 'package:flutter/material.dart';
import 'package:trainingassignment/auth/login_page.dart';
import './home_page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

//  title: Text ("BINUS", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold),
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      routes: {
        '/': (context) => const Home(),
        '/Login': (context) => const Login()
      },
      debugShowMaterialGrid: false,
    );
  }
}
