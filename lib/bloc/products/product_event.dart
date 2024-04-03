// Flutter Library
import 'package:equatable/equatable.dart';
import 'package:trainingassignment/model/product_model.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

// class FetchProductData extends ProductEvent {
//   @override
//   List<Object?> get props => [];
// }

class FetchProductData extends ProductEvent {
  int id;
  String? title;
  String? description;
  String? category;
  String? image;
  double price;
  List<int> rating;
  FetchProductData(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.price,
      required this.rating});

  @override
  List<Object?> get props => [];
}

class FetchListProductData extends ProductEvent {
  const FetchListProductData();
  @override
  List<Object?> get props => [];
}
