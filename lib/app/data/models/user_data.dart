class UserData {
  String? name;
  String? email;
  String? phone;
  String? password;

  UserData({this.name, this.email, this.phone, this.password});

  // Factory method untuk membuat objek dari JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }
}
