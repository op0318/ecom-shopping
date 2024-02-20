import 'dart:convert';

class Product {
  final String? id;
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String Categeory;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.Categeory,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'Categeory': Categeory,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'],
      name: map['name'],
      description: map['description'],
      quantity: map['quantity'].toDouble(),
      images: List<String>.from(map['images']),
      Categeory: map['Categeory'],
      price: map['price'].toDouble(),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
