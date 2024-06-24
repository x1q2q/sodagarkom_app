class Transaction {
  final int id;
  final String status;
  final String createdAt;
  Transaction({
    required this.id,
    required this.status,
    required this.createdAt,
  });
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
        id: map['id'], status: map['status'], createdAt: map['created_at']);
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'status': status, 'created_at': createdAt};
  }
}
