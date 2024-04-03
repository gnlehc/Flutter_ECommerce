import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

// Get Products using http method
class Product {
  final _baseURL = 'https://fakestoreapi.com/products';
  Future getProduct() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));

      if (response.statusCode == 200) {
        List<dynamic> item = jsonDecode(response.body);
        List<MsProduct>? prod = item.map((e) => MsProduct.fromJson(e)).toList();
        return prod;
      }
    } catch (e) {
      throw Exception('Oops, something went wrong :(');
    }
  }
}

class DetailBloc extends Bloc<String, MsProduct> {
  DetailBloc()
      : super(MsProduct(
            id: 0,
            title: "",
            description: "",
            category: "",
            image: "",
            price: 0,
            rating: [])) {
    on<String>((event, emit) async {
      try {
        var res = await getProductsfromId(event);
        emit(res);
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}

Future<MsProduct> getProductsfromId(String productId) async {
  // Products products = Products();
  final dio = Dio();
  var res = await dio.get("https://fakestoreapi.com/products/$productId");
  MsProduct prod = MsProduct(
    id: res.data['id'],
    title: res.data['title'],
    description: res.data['description'],
    category: res.data['category'],
    image: res.data['image'],
    price: res.data['price'].toDouble(),
    rating: res.data['rating']['rate'],
  );
  return prod;
}

// Get List of Category using flutter DIO
Future<List<String>> getCategories() async {
  List<String> categories = [];
  final dio = Dio();

  try {
    var res = await dio.get("https://fakestoreapi.com/products/categories");
    for (var category in res.data) {
      categories.add(category);
    }
    return categories;
  } catch (e) {
    throw Exception(e);
  }
}

// Get each product based on its category
Future<List<MsProduct>> getCategoryProd(String category) async {
  List<MsProduct> products = [];

  final dio = Dio();

  try {
    var res =
        await dio.get("https://fakestoreapi.com/products/category/$category");
    for (var json in res.data) {
      products.add(MsProduct(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        price: json['price'].toDouble(),
        rating: json['rating']['rate'].toInt(),
      ));
    }
    return products;
  } catch (e) {
    throw Exception(e);
  }
}
