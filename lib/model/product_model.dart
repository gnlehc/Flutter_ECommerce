import 'dart:convert';

import 'package:flutter/foundation.dart';

// PRODUCTS
class MsProduct {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final List<dynamic> rating;
  // named constructor
  MsProduct({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory MsProduct.fromJson(Map<String, dynamic> json) {
    final ratingList =
        json['rating'] is List ? List<dynamic>.from(json['rating']) : [];

    return MsProduct(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      price: json['price'].toDouble(),
      rating: ratingList,
    );
  }

  @override
  String toString() {
    return 'MsProduct(id: $id, title: $title, description: $description, category: $category, image: $image, price: $price, rating: $rating)';
  }

  // equality
  @override
  bool operator ==(covariant MsProduct other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.category == category &&
        other.image == image &&
        other.price == price &&
        listEquals(other.rating, rating);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        category.hashCode ^
        image.hashCode ^
        price.hashCode ^
        rating.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
      'price': price,
      'rating': rating,
    };
  }

  String toJson() => json.encode(toMap());
}

// LIST PRODUCTS
class ListProductModel {
  List<MsProduct>? data;

  ListProductModel({required this.data});
  ListProductModel.fromJson(Map<String, dynamic> json) {
    data = List<MsProduct>.from(json["data"].map((x) => MsProduct.fromJson(x)));
  }
  @override
  String toString() => 'ListProductModel(data: $data)';

  @override
  bool operator ==(covariant ListProductModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data!.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

// CATEGORY
class MsCategory {
  final String category;
  final int statusCode;
  final List<String> categories;

  MsCategory({
    required this.category,
    required this.statusCode,
    required this.categories,
  });

  factory MsCategory.fromJson(Map<String, dynamic> json) {
    return MsCategory(
      category: json['category'],
      statusCode: json['statusCode'],
      categories: List<String>.from(json['categories']),
    );
  }

  @override
  String toString() {
    return 'MsCategory(category: $category, statusCode: $statusCode, categories: $categories)';
  }

  @override
  bool operator ==(covariant MsCategory other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.statusCode == statusCode &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode {
    return category.hashCode ^ statusCode.hashCode ^ categories.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'statusCode': statusCode,
      'categories': categories,
    };
  }

  String toJson() => json.encode(toMap());
}
