import 'package:get/get.dart';

class Cart {
  final int id;
  final int productId;
  final int customerId;
  RxInt quantity;
  final String productName;
  final String productImage;
  final int productPrice;
  final String categoryName;
  final String addedDate;
  Cart(
      {required this.id,
      required this.productId,
      required this.customerId,
      required this.quantity,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.categoryName,
      required this.addedDate});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        id: int.parse(json['id']),
        productId: int.parse(json['product_id']),
        customerId: int.parse(json['customer_id']),
        quantity: RxInt(int.parse(json['quantity'])),
        productName: json['product_name'],
        productImage: json['product_image'] ?? '',
        productPrice: int.parse(json['product_price']),
        categoryName: json['category_name'],
        addedDate: json['added_date']);
  }
  Map toMap() {
    return {
      'id': id,
      'product_id': productId,
      'customer_id': customerId,
      'quantity': quantity.value,
      'product_name': productName,
      'product_image': productImage,
      'product_price': productPrice,
      'category_name': categoryName,
      'added_date': addedDate
    };
  }
}
