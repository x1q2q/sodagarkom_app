import 'transaction_product.dart';

class TransactionConfirm {
  final int customerId;
  final String customerName;
  String customerAddress;
  final String paymentMethod;
  final String paymentText;
  final int totalShipping;
  final int cartsQty;
  final int cartsPrice;
  final int totalAmount;
  final List<TransactionProduct>? products;

  TransactionConfirm(
      {required this.customerId,
      required this.customerName,
      required this.customerAddress,
      required this.paymentMethod,
      required this.paymentText,
      required this.totalShipping,
      required this.cartsQty,
      required this.cartsPrice,
      required this.totalAmount,
      this.products});

  factory TransactionConfirm.fromJson(Map<String, dynamic> json) {
    List<TransactionProduct> extractProducts =
        List.generate(json['products'].length, (j) {
      return TransactionProduct.fromJson(json['products'][j]);
    });
    return TransactionConfirm(
        customerId: int.parse(json['customer_id']),
        customerName: json['customer_fullname'],
        customerAddress: json['customer_address'],
        paymentMethod: json['payment_method'],
        paymentText: json['payment_method_text'],
        totalShipping: json['total_shipping'],
        cartsQty: json['total_cart_qty'],
        cartsPrice: json['total_cart_price'],
        totalAmount: json['total_amount'],
        products: extractProducts);
  }
  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'customer_name': customerName,
      'customer_address': customerAddress,
      'payment_method': paymentMethod,
      'payment_text': paymentText,
      'total_shipping': totalShipping,
      'total_cart_qty': cartsQty,
      'total_cart_price': cartsPrice,
      'total_amount': totalAmount
    };
  }
}
