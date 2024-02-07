import 'dart:convert';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String Categeory;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.Categeory,
    required this.price,
  });

  Map<String, dynamic> jsonobject() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'categeory': Categeory,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      description: map['description'],
      quantity: map['quantity'],
      images: map['images'],
      Categeory: map['categeory'],
      price: map['price'],
    );
  }

  String toJson() {
    return jsonEncode(jsonobject());
  }
}
