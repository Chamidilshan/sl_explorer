// To parse this JSON data, do
//
//     final wishlist = wishlistFromJson(jsonString);

import 'dart:convert';

Wishlist wishlistFromJson(String str) => Wishlist.fromJson(json.decode(str));

String wishlistToJson(Wishlist data) => json.encode(data.toJson());

class Wishlist {
  String userId;
  List<Wish> wishes;

  Wishlist({
    required this.userId,
    required this.wishes,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
    userId: json["userId"],
    wishes: List<Wish>.from(json["wishes"].map((x) => Wish.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "wishes": List<dynamic>.from(wishes.map((x) => x.toJson())),
  };
}

class Wish {
  String packageType;
  String packageId;

  Wish({
    required this.packageType,
    required this.packageId,
  });

  factory Wish.fromJson(Map<String, dynamic> json) => Wish(
    packageType: json["packageType"],
    packageId: json["packageId"],
  );

  Map<String, dynamic> toJson() => {
    "packageType": packageType,
    "packageId": packageId,
  };
}
