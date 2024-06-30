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

  TransactionConfirm(
      {required this.customerId,
      required this.customerName,
      required this.customerAddress,
      required this.paymentMethod,
      required this.paymentText,
      required this.totalShipping,
      required this.cartsQty,
      required this.cartsPrice,
      required this.totalAmount});

  factory TransactionConfirm.fromJson(Map<String, dynamic> json) {
    return TransactionConfirm(
        customerId: int.parse(json['customer_id']),
        customerName: json['customer_fullname'],
        customerAddress: json['customer_address'],
        paymentMethod: json['payment_method'],
        paymentText: json['payment_method_text'],
        totalShipping: json['total_shipping'],
        cartsQty: json['total_cart_qty'],
        cartsPrice: json['total_cart_price'],
        totalAmount: json['total_amount']);
  }
}
