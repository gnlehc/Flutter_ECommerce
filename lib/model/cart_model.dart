import 'package:trainingassignment/model/product_model.dart';

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

class CartProductModel extends MsProduct {
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
