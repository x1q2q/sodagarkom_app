class Cart {
  final int id;
  final int productId;
  final int userId;
  final int quantity;
  final String productName;
  final int productPrice;
  final String categoryName;
  final String addedDate;
  Cart(
      {required this.id,
      required this.productId,
      required this.userId,
      required this.quantity,
      required this.productName,
      required this.productPrice,
      required this.categoryName,
      required this.addedDate});

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
        id: map['id'],
        productId: map['product_id'],
        userId: map['user_id'],
        quantity: map['quantity'],
        productName: map['product_name'],
        productPrice: map['product_price'],
        categoryName: map['category_name'],
        addedDate: map['added_date']);
  }
  Map toMap() {
    return {
      'id': id,
      'product_id': productId,
      'user_id': userId,
      'quantity': quantity,
      'product_name': productName,
      'product_price': productPrice,
      'category_name': categoryName,
      'added_date': addedDate
    };
  }
}
