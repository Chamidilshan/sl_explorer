import 'package:flutter/material.dart';

class RoundTrip {
  final String? id;
  final String? packageName;
  final String? packageShortDescription;
  final String? packageCoverDescription;
  final String? packageCoverImage;
  final List<String>? packageImageLinks;
  final String? packageTitle;
  final String? packageSubTitle;
  final int? packageTotalSeats;
  final List<Itenary>? itenary;
  final List<Hotel>? hotels;
  final Prices? prices;

  RoundTrip({
    this.id,
    this.packageName,
    this.packageShortDescription,
    this.packageCoverDescription,
    this.packageCoverImage,
    this.packageImageLinks,
    this.packageTitle,
    this.packageSubTitle,
    this.packageTotalSeats,
    this.itenary,
    this.hotels,
    this.prices,
  });

  factory RoundTrip.fromJson(Map<String, dynamic> json) {
    return RoundTrip(
      id: json['_id'],
      packageName: json['packageName'],
      packageShortDescription: json['packageShortDescription'],
      packageCoverDescription: json['packageCoverDescription'],
      packageCoverImage: json['packageCoverImage'],
      packageImageLinks: json['packageImageLinks'] != null ? List<String>.from(json['packageImageLinks'].where((item) => item != null)) : null,
      packageTitle: json['packageTitle'],
      packageSubTitle: json['packageSubTitle'],
      packageTotalSeats: json['packageTotalSeats'],
      itenary: json['itenary'] == null ? null : List<Itenary>.from(json['itenary'].map((x) => Itenary.fromJson(x))),
      hotels: json['hotels'] == null ? null : List<Hotel>.from(json['hotels'].map((x) => Hotel.fromJson(x))),
      prices: json['prices'] == null ? null : Prices.fromJson(json['prices']),
    );
  }
}


class Itenary {
  final int? dayNumber;
  final String? dayName;
  final List<String>? location;
  final String? description;
  final String? optionalDescription;

  Itenary({
    this.dayNumber,
    this.dayName,
    this.location,
    this.description,
    this.optionalDescription,
  });

  factory Itenary.fromJson(Map<String, dynamic> json) {
    return Itenary(
      dayNumber: json['dayNumber'],
      dayName: json['dayName'],
      location: json['location'] == null ? null : List<String>.from(json['location']),
      description: json['description'],
      optionalDescription: json['optionalDescription'],
    );
  }
}

class Hotel {
  final HotelDetails? hotel;
  final String? hotelRoomDesc;
  final String? hotelLocationDesc;

  Hotel({
    this.hotel,
    this.hotelRoomDesc,
    this.hotelLocationDesc,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      hotel: json['hotel'] == null ? null : HotelDetails.fromJson(json['hotel']),
      hotelRoomDesc: json['hotelRoomDesc'],
      hotelLocationDesc: json['hotelLocationDesc'],
    );
  }
}

class HotelDetails {
  final String? id;
  final String? hotelName;
  final String? hotelDistrict;
  final String? hotelImage;

  HotelDetails({
    this.id,
    this.hotelName,
    this.hotelDistrict,
    this.hotelImage,
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

class Prices {
  final GroupPrices? group;
  final PrivatePrices? private;

  Prices({
    this.group,
    this.private,
  });

  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      group: json['group'] == null ? null : GroupPrices.fromJson(json['group']),
      private: json['private'] == null ? null : PrivatePrices.fromJson(json['private']),
    );
  }
}

class GroupPrices {
  final int? single;
  final int? double;
  final int? triple;

  GroupPrices({
    this.single,
    this.double,
    this.triple,
  });

  factory GroupPrices.fromJson(Map<String, dynamic> json) {
    return GroupPrices(
      single: json['single'],
      double: json['double'],
      triple: json['triple'],
    );
  }
}

class PrivatePrices {
  final int? single;
  final int? double;
  final int? triple;

  PrivatePrices({
    this.single,
    this.double,
    this.triple,
  });

  factory PrivatePrices.fromJson(Map<String, dynamic> json) {
    return PrivatePrices(
      single: json['single'],
      double: json['double'],
      triple: json['triple'],
    );
  }
}
