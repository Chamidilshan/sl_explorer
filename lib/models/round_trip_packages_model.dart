import 'package:flutter/material.dart';

class RoundTrip {
  final String id;
  final String packageName;
  final String packageShortDescription;
  final String packageCoverDescription;
  final String packageCoverImage;
  final List<String> packageImageLinks;
  final String packageTitle;
  final String packageSubTitle;
  final int packageTotalSeats;
  final List<Itenary> itenary;
  final List<Hotel> hotels;

  RoundTrip({
    required this.id,
    required this.packageName,
    required this.packageShortDescription,
    required this.packageCoverDescription,
    required this.packageCoverImage,
    required this.packageImageLinks,
    required this.packageTitle,
    required this.packageSubTitle,
    required this.packageTotalSeats,
    required this.itenary,
    required this.hotels,
  });

  factory RoundTrip.fromJson(Map<String, dynamic> json) {
    return RoundTrip(
      id: json['_id'],
      packageName: json['packageName'],
      packageShortDescription: json['packageShortDescription'],
      packageCoverDescription: json['packageCoverDescription'],
      packageCoverImage: json['packageCoverImage'],
      packageImageLinks: List<String>.from(json['packageImageLinks']),
      packageTitle: json['packageTitle'],
      packageSubTitle: json['packageSubTitle'],
      packageTotalSeats: json['packageTotalSeats'],
      itenary: List<Itenary>.from(json['itenary'].map((x) => Itenary.fromJson(x))),
      hotels: List<Hotel>.from(json['hotels'].map((x) => Hotel.fromJson(x))),
    );
  }
}

class Itenary {
  final int dayNumber;
  final String dayName;
  final List<String> location;
  final String description;
  final String optionalDescription;

  Itenary({
    required this.dayNumber,
    required this.dayName,
    required this.location,
    required this.description,
    required this.optionalDescription,
  });

  factory Itenary.fromJson(Map<String, dynamic> json) {
    return Itenary(
      dayNumber: json['dayNumber'],
      dayName: json['dayName'],
      location: List<String>.from(json['location']),
      description: json['description'],
      optionalDescription: json['optionalDescription'],
    );
  }
}

class Hotel {
  final HotelDetails hotel;
  final String hotelRoomDesc;
  final String hotelLocationDesc;

  Hotel({
    required this.hotel,
    required this.hotelRoomDesc,
    required this.hotelLocationDesc,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      hotel: HotelDetails.fromJson(json['hotel']),
      hotelRoomDesc: json['hotelRoomDesc'],
      hotelLocationDesc: json['hotelLocationDesc'],
    );
  }
}

class HotelDetails {
  final String id;
  final String hotelName;
  final String hotelDistrict;
  final String hotelImage;

  HotelDetails({
    required this.id,
    required this.hotelName,
    required this.hotelDistrict,
    required this.hotelImage,
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) {
    return HotelDetails(
      id: json['_id'],
      hotelName: json['hotelName'],
      hotelDistrict: json['hotelDistrict'],
      hotelImage: json['hotelImage'],
    );
  }
}
