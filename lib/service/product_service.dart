import 'package:dio/dio.dart';
import 'package:trainingassignment/model/product_model.dart';

class ProductService {
  final dio = Dio();
  final _baseURL = 'https://fakestoreapi.com/products';

  Future<ListProductModel> getProduct() async {
    final dio = Dio();
    try {
      final res = await dio.get(_baseURL);
      return ListProductModel.fromJson(res.data);
    } catch (e) {
      throw Exception('Oops, something went wrong :(');
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
      // if (res.statusCode != 200) {
      //   return categories;
      // }
      for (var category in res.data) {
        categories.add(category);
      }
      // categories = res.data as List<String>;
      // print(categories[0]);
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
}
