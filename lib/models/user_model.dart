import 'package:flutter/material.dart';

class UserModel {
  final String id;
  final String firstName;
  String lastName;
  final String familyName;
  String username;
  final String email;
  String phoneNumber;
  final String password;
  String profilePicture;
  String? country;
  String? state;
  String? city;


  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.familyName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.profilePicture,
    this.country,
    this.state,
    this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      familyName: json['familyName'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'familyName': familyName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'profilePicture': profilePicture,
      'country': country,
      'state': state,
      'city': city,
    };
  }
}
