class User {
  final String name;
  final String email;
  final String phone;
  final String photoUrl;
  final String uid;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.photoUrl,
      required this.uid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        photoUrl: json['photoUrl'],
        uid: json['uid']);
  }

  // toJson
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'photoUrl': photoUrl,
        'uid': uid
      };
}
