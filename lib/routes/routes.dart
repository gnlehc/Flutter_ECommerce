import "package:fluro/fluro.dart";
import "package:flutter/widgets.dart";
import 'package:trainingassignment/pages/home.dart';

import '../pages/login_page.dart';
import '../cart/cart.dart';
import '../pages/category_page.dart';
import '../home_page/detail_product.dart';

class Routes {
  static void defineRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const Text("Not Found or Invalid Page");
    });

    router.define("/", handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Home();
    }));

    // router.define("/category", handler: Handler(
    //     handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    //   return Categories();
    // }));

    router.define("/login", handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Login();
    }));

    router.define("/cart", handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Cart();
    }));

    router.define("/products/:id", handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return DetailProduct(
        id: params["id"][0],
      );
    }));
  }
}
