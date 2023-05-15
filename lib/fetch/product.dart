import 'dart:convert';
import 'package:dio/dio.dart';

import 'model.dart';
import 'package:http/http.dart' as http;

// Get Products using http method
class Product {
  final _baseURL = 'https://fakestoreapi.com/products';
  Future getProduct() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));

      if (response.statusCode == 200) {
        List<dynamic> item = jsonDecode(response.body);
        List<Products>? prod = item.map((e) => Products.fromJson(e)).toList();
        return prod;
      }
    } catch (e) {
      throw Exception('Oops, something went wrong :(');
    }
  }
}

// class FilteredProductsBasedOnCategory {
//   Future<List<Products>> getCategProduct(String category) async {
//     final response =
//         await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       List<Products> products =
//           data.map((json) => Products.fromJson(json)).toList();

//       // Filter products based on category
//       products =
//           products.where((product) => product.category == category).toList();

//       return products;
//     } else {
//       throw Exception('Oops, something went wrong :(');
//     }
//   }
// }

// Get List of Category using flutter DIO
Future<List<String>> getCategories() async {
  List<String> categories = [];

  final dio = Dio();

  try {
    var res = await dio.get("https://fakestoreapi.com/products/categories");
    // if (res.statusCode != 200) {
    //   return categories;
    // }
    for (var category in res.data) {
      categories.add(category);
    }
    // categories = res.data as List<String>;
    // print(categories[0]);
    return categories;
  } catch (e) {}

  return categories;
}

// Get each product based on its category
Future<List<Products>> getCategoryProd(String category) async {
  List<Products> products = [];

  final dio = Dio();

  try {
    var res =
        await dio.get("https://fakestoreapi.com/products/category/$category");
    // if (res.statusCode != 200) {
    //   return categories;
    // }
    for (var json in res.data) {
      products.add(Products(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        price: json['price'].toDouble(),
        rating: json['rating']['rate'].toInt(),
      ));
    }
    // categories = res.data as List<String>;
    // print("title: ${products[0].title}");
    return products;
  } catch (e) {}

  return products;
}

// // Get All Users
// Future<List<String>> getUsers() async {
//   List<String> user = [];
//   final dio = Dio();
//   try {
//     var users = await dio.get("https://fakestoreapi.com/users");
//     for (var allUser in users.data) {
//       allUser.add(user);
//     }
//     return user;
//   } catch (e) {
//     throw Exception(e);
//   }
// }

// Get Cart Based on userId
// Future<List<CartModel>> getUsersCart(int id) async {
//   final dio = Dio();
//   List<CartModel> carts = [];
//   try {
//     var cart = await dio.get("https://fakestoreapi.com/carts/$id");
//     for (var json in cart.data) {
//       carts.add(
//         CartModel(
//           id: json['id'],
//           userId: json['userId'],
//           date: json['date'],
//           products: json['products']['productId']['quantity'],
//         ),
//       );
//     }
//   } catch (e) {
//     throw Exception(e);
//   }
//   return carts;
// }
