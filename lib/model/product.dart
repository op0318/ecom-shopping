class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String Categeory;
  final double price;
  final String? id;
  final String? userId;

  Product(
      {required this.name,
      required this.description,
      required this.quantity,
      required this.images,
      required this.Categeory,
      required this.price,
      required this.id,
      required this.userId});

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'categeory': Categeory,
      'price': price,
      'id': id,
      'userId': userId
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
        id: map['id'],
        userId: map['userId']);
  }
}
