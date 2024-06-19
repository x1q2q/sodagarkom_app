class Product {
  final int id;
  final String name;
  final String categoryName;
  final int stock;
  final int price;
  final String description;

  Product(
      {required this.id,
      required this.name,
      required this.categoryName,
      required this.stock,
      required this.price,
      required this.description});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        name: map['name'],
        categoryName: map['category_name'],
        stock: map['stock'],
        price: map['price'],
        description: map['description']);
  }
  Map toJson() {
    return {
      'id': id,
      'name': name,
      'category_name': categoryName,
      'stock': stock,
      'price': price,
      'description': description
    };
  }
}
