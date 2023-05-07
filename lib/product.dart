import 'dart:convert';
import './model.dart';
import 'package:http/http.dart' as http;

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
      print(e.toString());
    }
  }
}
