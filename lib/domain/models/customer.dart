class Customer {
  final int id;
  final String username;
  final String email;
  final String fullName;
  final String phone;
  final String address;
  final String createdAt;

  Customer(
      {required this.id,
      required this.username,
      required this.email,
      required this.fullName,
      required this.phone,
      required this.address,
      required this.createdAt});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: int.parse(json['id']),
      username: json['username'],
      email: json['email'],
      fullName: json['full_name'],
      phone: json['phone'],
      address: json['address'],
      createdAt: json['created_at'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'address': address,
      'created_at': createdAt
    };
  }
}
