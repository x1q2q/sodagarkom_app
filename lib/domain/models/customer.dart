class Customer {
  final int id;
  final String username;
  final String email;
  final String? fullName;
  final String phone;
  final String address;
  final String? createdAt;
  final String? password;

  Customer(
      {required this.id,
      required this.username,
      required this.email,
      this.fullName,
      required this.phone,
      required this.address,
      this.createdAt,
      this.password});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        id: int.parse(json['id']),
        username: json['username'],
        email: json['email'],
        fullName: json['full_name'],
        phone: json['phone'],
        address: json['address'],
        createdAt: json['created_at'],
        password: json['password']);
  }

  Map toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'address': address,
      'password': password
    };
  }
}
