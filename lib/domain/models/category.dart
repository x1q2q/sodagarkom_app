import 'product.dart';

class Category {
  final int id;
  final String name;
  final String description;
  final String imageThumb;
  final List<Product>? products;

  Category(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageThumb,
      this.products});

  factory Category.fromJson(Map<String, dynamic> json) {
    List<Product> extractProducts = List.generate(json['products'].length, (j) {
      return Product.fromJson(json['products'][j]);
    });
    return Category(
        id: int.parse(json['id']),
        name: json['name'],
        description: json['description'],
        imageThumb: json['image_thumb'] ?? '',
        products: extractProducts);
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_thumb': imageThumb,
      'products': products
    };
  }
}
