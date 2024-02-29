// To parse this JSON data, do
//
//     final wishlist = wishlistFromJson(jsonString);

import 'dart:convert';

Wishlist wishlistFromJson(String str) => Wishlist.fromJson(json.decode(str));

String wishlistToJson(Wishlist data) => json.encode(data.toJson());

class Wishlist {
   String userId;
   List<String> wishes;

  Wishlist({
    required this.userId,
    required this.wishes,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
    userId: json["userId"],
    wishes: List<String>.from(json['wishes'] as List<String>),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "wishes": wishes,
  };
}
