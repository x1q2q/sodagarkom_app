class TransactionProduct {
  final int productId;
  final String productName;
  final int productPrice;
  final String productImage;
  final int productQuantity;
  final int totalPrice;
  TransactionProduct(
      {required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productQuantity,
      required this.totalPrice});

  factory TransactionProduct.fromJson(Map<String, dynamic> json) {
    return TransactionProduct(
        productId: int.parse(json['product_id']),
        productName: json['product_name'],
        productPrice: int.parse(json['product_price']),
        productImage: json['product_image'] ?? '',
        productQuantity: int.parse(json['product_quantity']),
        totalPrice: int.parse(json['total_price']));
  }
}
