import 'product.dart';

class Category {
  final int id;
  final String name;
  final String description;
  final List<Product>? products;

  Category(
      {required this.id,
      required this.name,
      required this.description,
      this.products});
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        id: int.parse(map['id']),
        name: map['name'],
        description: map['description'],
        products: map['products']);
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'products': products
    };
  }
}
