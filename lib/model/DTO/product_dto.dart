import 'dart:convert';

class ProductDTO {
  int? id;
  String? title;
  String? description;
  String? category;
  String? image;
  double? price;
  double? rating;

  ProductDTO(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.image,
      this.price,
      this.rating});

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
