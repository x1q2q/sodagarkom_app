class Product {
  final int id;
  final String name;
  final String categoryName;
  final int stock;
  final int price;
  final String description;
  final String imageThumb;

  Product(
      {required this.id,
      required this.name,
      required this.categoryName,
      required this.stock,
      required this.price,
      required this.description,
      required this.imageThumb});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id']),
      name: json['name'],
      categoryName: json['category_name'],
      stock: int.parse(json['stock_temporary']),
      price: int.parse(json['price']),
      description: json['description'],
      imageThumb: json['image_thumb'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_name': categoryName,
      'stock': stock,
      'price': price,
      'description': description,
      'image_thumb': imageThumb
    };
  }
}
