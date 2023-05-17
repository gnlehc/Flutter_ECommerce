import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/auth/login_page.dart';
import 'package:trainingassignment/bloc/observer.dart';
import 'package:trainingassignment/cart/cart.dart';
import 'package:trainingassignment/category/categories.dart';
import './home_page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluro/fluro.dart';
import '/config/routes.dart';
import 'config/router.dart';
import 'fetch/model.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

//  title: Text ("BINUS", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold),
class MyApp extends StatelessWidget {
  // late int userId;
  MyApp({Key? key}) : super(key: key){
    final router = FluroRouter();
    Routes.defineRoutes(router);
    Application.router = router;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments == null
    //     ? ScreenArguments()
    //     : ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    // if (args.userId.isNaN) userId = args.userId;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      initialRoute: '/',
      // routes: {
      //   '/': (context) => Home(),
      //   '/Category': (context) => Categories(),
      //   '/Cart': (context) => Cart(),
      //   '/Login': (context) => Login(),
      //   // '/Product': (context) => DetailProduct(detail: Products.),
      // },
      debugShowMaterialGrid: false,
      onGenerateRoute: Application.router.generator,
    );
  }
}
