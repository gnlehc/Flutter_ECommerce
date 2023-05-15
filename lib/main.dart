import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/auth/login_page.dart';
import 'package:trainingassignment/bloc/observer.dart';
import 'package:trainingassignment/cart/cart.dart';
import 'package:trainingassignment/category/categories.dart';
import 'package:trainingassignment/home_page/detail_product.dart';
import './home_page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fetch/model.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

//  title: Text ("BINUS", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold),
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/Category': (context) => Categories(),
        '/Cart': (context) => const Cart(),
        '/Login': (context) => Login(),
        // '/Product': (context) => DetailProduct(detail: Products.),
      },
      debugShowMaterialGrid: false,
    );
  }
}
