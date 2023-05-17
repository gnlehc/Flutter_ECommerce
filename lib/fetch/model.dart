// PRODUCTS
class Products {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final double rating;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      price: json['price'].toDouble(),
      rating: json['rating']['rate'].toInt(),
    );
  }
}

//CATEGORY
// Category State
class CategoryModel {
  late String category = '';
  late int retcode = 0;
  late List<String> categories = [];

  CategoryModel(
      {this.category = "", required this.retcode, required this.categories});
}

// USER AND LOGIN
// LOGIN STATE
class LoginModel {
  final String email;
  final String password;
  final String username;
  late String token;
  late int retcode;

  LoginModel({
    required this.email,
    required this.password,
    required this.username,
    this.token = '',
    this.retcode = 0,
  });
}

// LOGIN EVENT
class LoginToken {
  final String email;
  final String password;

  LoginToken({
    required this.email,
    required this.password,
  });
}

// CART EACH USER ID
class CartModel {
  final int id;
  final int userId;
  final String date;
  // final List<CartProduct> products;
  late final List<int> products;

  CartModel(
      {required this.id,
      required this.userId,
      required this.date,
      required this.products});
}

class CartProductModel extends Products {
  final int quantity;

  CartProductModel(
      {required this.quantity,
      required super.id,
      required super.title,
      required super.description,
      required super.category,
      required super.image,
      required super.price,
      required super.rating});
}

class ScreenArguments {
  late String username;
  late int userId;
  ScreenArguments({this.username = "", this.userId = 0});
}
