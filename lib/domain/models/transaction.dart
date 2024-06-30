import 'transaction_product.dart';

class Transaction {
  final int id;
  final String code;
  final int userId;
  final String status;
  final int totalAmount;
  final int totalAmountProduct;
  final int totalShipping;
  final String paymentMethod;
  final String paymentProof;
  final String createdAt;
  final List<TransactionProduct>? products;
  Transaction(
      {required this.id,
      required this.code,
      required this.userId,
      required this.status,
      required this.totalAmount,
      required this.totalAmountProduct,
      required this.totalShipping,
      required this.paymentMethod,
      required this.paymentProof,
      required this.createdAt,
      this.products});
  factory Transaction.fromJson(Map<String, dynamic> json) {
    List<TransactionProduct> extractProducts =
        List.generate(json['products'].length, (j) {
      return TransactionProduct.fromJson(json['products'][j]);
    });
    return Transaction(
        id: int.parse(json['id']),
        code: json['code'],
        userId: int.parse(json['customer_id']),
        status: json['status'],
        totalAmount: json['total_amount'],
        totalAmountProduct: json['total_amount_product'],
        totalShipping: json['total_shipping'],
        paymentMethod: json['payment_method'] ?? '',
        paymentProof: json['payment_proof'] ?? '',
        createdAt: json['created_at'],
        products: extractProducts);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'user_id': userId,
      'status': status,
      'total_amount': totalAmount,
      'total_amount_product': totalAmountProduct,
      'total_shippin': totalShipping,
      'payment_method': paymentMethod,
      'payment_proof': paymentProof,
      'created_at': createdAt
    };
  }
}
