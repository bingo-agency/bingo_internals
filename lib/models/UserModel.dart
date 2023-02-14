import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.time,
    required this.isActive,
  });

  String? id;
  String? uid;
  String name;
  String email;
  String imageUrl;
  String time;
  bool isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'name': name,
        'email': email,
        'imageUrl': imageUrl,
        'time': time,
        'isActive': isActive,
      };
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        time: json["time"],
        isActive: json["isActive"],
      );
}
