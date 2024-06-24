class User {
  final int id;
  final String username;
  final String email;
  final String fullName;
  final String noTelepon;
  final String address;
  final String createdAt;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.fullName,
      required this.noTelepon,
      required this.address,
      required this.createdAt});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['id'],
      email: map['id'],
      fullName: map['full_name'],
      noTelepon: map['no_telepon'],
      address: map['address'],
      createdAt: map['created_at'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'full_name': fullName,
      'no_telepon': noTelepon,
      'address': address,
      'created_at': createdAt
    };
  }
}
