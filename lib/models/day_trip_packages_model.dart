import 'package:flutter/material.dart';

class DayTrip {
  final String id;
  final String packageCategoryName;
  final String packageCategoryImage;
  final int packageDays;
  final String packageName;
  final String packageShortDescription;
  final String packageCoverDescription;
  final String packageCoverImage;
  final String packageTitle;
  final String packageSubTitle;
  final List<String> packageImageLinks;
  final List<Location> locations;
  final List<Hotel> hotels;
  final List<Service> services;
  final int price;


  DayTrip({
    required this.id,
    required this.packageCategoryName,
    required this.packageCategoryImage,
    required this.packageDays,
    required this.packageName,
    required this.packageShortDescription,
    required this.packageCoverDescription,
    required this.packageCoverImage,
    required this.packageTitle,
    required this.packageSubTitle,
    required this.packageImageLinks,
    required this.locations,
    required this.hotels,
    required this.services,
    required this.price,
  });

  factory DayTrip.fromJson(Map<String, dynamic> json) {
    try {
      return DayTrip(
        id: json['_id'],
        packageCategoryName: json['packageCategoryName'],
        packageCategoryImage: json['packageCategoryImage'],
        packageDays: json['packageDays'],
        packageName: json['packageName'],
        packageShortDescription: json['packageShortDescription'],
        packageCoverDescription: json['packageCoverDescription'],
        packageCoverImage: json['packageCoverImage'],
        packageTitle: json['packageTitle'],
        packageSubTitle: json['packageSubTitle'],
        packageImageLinks: List<String>.from(json['packageImageLinks']),
        locations: (json['locations'] as List<dynamic>?)
            ?.map((location) => Location.fromJson(location))
            .toList() ??
            [],
        hotels: (json['hotels'] as List<dynamic>)
            .map((dynamic x) => x is String ? Hotel(hotel: HotelDetails(id: '', hotelName: '', hotelDistrict: '', hotelImage: ''), hotelRoomDesc: '', hotelLocationDesc: '') : Hotel.fromJson(x))
            .toList(),
        services: (json['services'] as List<dynamic>?)
            ?.map((service) => Service.fromJson(service))
            .toList() ??
            [],
        price: json['price'],
      );
    } catch (e) {
      print('Error parsing DayTrip: $e');
      print('JSON data: $json');
      return DayTrip(
        id: '',
        packageCategoryName: '',
        packageCategoryImage: '',
        packageDays: 0,
        packageName: '',
        packageShortDescription: '',
        packageCoverDescription: '',
        packageCoverImage: '',
        packageTitle: '',
        packageSubTitle: '',
        packageImageLinks: [],
        locations: [],
        hotels: [],
        services: [],
        price: 0,
      );
    }
  }

}
class Service {
  final String category;
  final String name;

  Service({
    required this.category,
    required this.name,
  });

  factory Service.fromJson(dynamic json) {
    try {
      return Service(
        category: json['category'] ?? '',
        name: json['name'] ?? '',
      );
    } catch (e) {
      print('Error parsing Service: $e');
      print('JSON data: $json');
      return Service(
        category: '',
        name: '',
      );
    }
  }
}
class Location {
  final String name;
  final int prices;
  final List<Dates> avaliableDates;

  Location({
    required this.name,
    required this.prices,
    required this.avaliableDates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] ?? '',
      prices: json['prices']?? '',
      avaliableDates: (json['avaliableDates'] as List<dynamic>?)
          ?.map((date) => Dates.fromJson(date))
          .toList() ??
          [],
    );
  }
}
class Dates {
  final String dayName;
  final bool avaliability;

  Dates({
    required this.dayName,
    required this.avaliability,
  });

  factory Dates.fromJson(dynamic json) {
    try {
      if (json is String) {
        // Handle the case where json is a string
        return Dates(dayName: '', avaliability: false);
      } else {
        // Handle the case where json is a map
        return Dates(
          dayName: json['dayName'],
          avaliability: json['avaliability'],
        );
      }
    } catch (e) {
      print('Error parsing Dates: $e');
      print('JSON data: $json');
      return Dates(dayName: '', avaliability: false);
    }
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
    try {
      return Hotel(
        hotel: HotelDetails.fromJson(json['hotel']),
        hotelRoomDesc: json['hotelRoomDesc'],
        hotelLocationDesc: json['hotelLocationDesc'],
      );
    } catch (e) {
      print('Error parsing Hotel: $e');
      print('JSON data: $json');
      return Hotel(
        hotel: HotelDetails(id: '', hotelName: '', hotelDistrict: '', hotelImage: ''),
        hotelRoomDesc: '',
        hotelLocationDesc: '',
      );
    }
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
    try {
      return HotelDetails(
        id: json['_id'],
        hotelName: json['hotelName'],
        hotelDistrict: json['hotelDistrict'],
        hotelImage: json['hotelImage'],
      );
    } catch (e) {
      print('Error parsing HotelDetails: $e');
      print('JSON data: $json');
      return HotelDetails(id: '', hotelName: '', hotelDistrict: '', hotelImage: '');
    }
  }
}