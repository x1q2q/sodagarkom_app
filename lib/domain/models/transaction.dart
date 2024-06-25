class Transaction {
  final int id;
  final int userId;
  final String status;
  final String createdAt;
  Transaction({
    required this.id,
    required this.userId,
    required this.status,
    required this.createdAt,
  });
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
        id: map['id'],
        userId: map['user_id'],
        status: map['status'],
        createdAt: map['created_at']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'status': status,
      'created_at': createdAt
    };
  }
}
