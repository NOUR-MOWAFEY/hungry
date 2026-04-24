class UserModel {
  final String name;
  final String email;
  final String? image;
  final String? visa;
  final String? token;
  final String? address;

  UserModel({
    required this.name,
    required this.email,
    this.image,
    this.visa,
    this.token,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      address: json['address'] ?? '',
      token: json['token'] ?? '',
      visa: json['Visa'] ?? '',
    );
  }
}
