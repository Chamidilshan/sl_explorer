import 'package:SL_Explorer/models/round2.dart';
import 'package:SL_Explorer/models/round_trip_packages_model.dart';

class OrderRequest {
  final String customerId;
  final String package;
  final String orderDate;
  final int noOfPeople;
  final String option;

  OrderRequest({
    required this.customerId,
    required this.package,
    required this.orderDate,
    required this.noOfPeople,
    required this.option,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'package': package,
      'orderDate': orderDate,
      'noOfPeople': noOfPeople,
      'option': option,
    };
  }

  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return OrderRequest(
    customerId: json['customerId'],
    package: "kjkjfdfdjkfidfsjd",//json['packageId.roundTrip'],
    orderDate: json['orderDate'],
    noOfPeople: 3,//json['noOfPeople'],
    option: "option",//json['option'],
    );
  }

}











class Order {
  String orderId;
  String customerId;
  PackageId packageId;
  DateTime orderDate;
  DateTime tripDate;
  NoOfPeople noOfPeople;
  Rooms rooms;
  String status;
  Price price;
  Advance? advance;
  String? paymentComments;
  List<Option>? options;

  Order({
    required this.orderId,
    required this.customerId,
    required this.packageId,
    required this.orderDate,
    required this.tripDate,
    required this.noOfPeople,
    required this.rooms,
    required this.status,
    required this.price,
    this.advance,
    this.paymentComments,
    this.options,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['_id'],
      customerId: json['customerId'],
      packageId: PackageId.fromJson(json['packageId']),
      orderDate: DateTime.parse(json['orderDate']),
      tripDate: DateTime.parse(json['tripDate']),
      noOfPeople: NoOfPeople.fromJson(json['noOfPeople']),
      rooms: Rooms.fromJson(json['rooms']),
      status: json['status'],
      price: Price.fromJson(json['price']),
      advance: Advance.fromJson(json['advance']),
      paymentComments: json['paymentComments'],
      options: (json['option'] as List<dynamic>)
          .map((option) => Option.fromJson(option))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      // 'packageId': packageId.toJson(),
      'orderDate': orderDate.toIso8601String(),
      'tripDate': tripDate.toIso8601String(),
      'noOfPeople': noOfPeople.toJson(),
      'rooms': rooms.toJson(),
      'status': status,
      'price': price.toJson(),
      'advance': advance!.toJson(),
      'paymentComments': paymentComments!,
      'option': options!.map((option) => option.toJson()).toList(),
    };
  }
}

class PackageId {
  Round? roundTrip;
  String? dayTrip;

  PackageId({
    this.roundTrip,
    this.dayTrip,
  });

  factory PackageId.fromJson(Map<String, dynamic> json) {
    return PackageId(
      roundTrip: Round.fromJson(json['roundTrip']),
      dayTrip: json['dayTrip'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roundTrip': roundTrip,
      'dayTrip': dayTrip,
    };
  }
}

class NoOfPeople {
  int adults;
  int children;

  NoOfPeople({
    required this.adults,
    required this.children,
  });

  factory NoOfPeople.fromJson(Map<String, dynamic> json) {
    return NoOfPeople(
      adults: json['adults'],
      children: json['children'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adults': adults,
      'children': children,
    };
  }
}

class Rooms {
  num single;
  num double;
  num triple;
  num quadruple;

  Rooms({
    required this.single,
    required this.double,
    required this.triple,
    required this.quadruple,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) {
    return Rooms(
      single: json['single'],
      double: json['double'],
      triple: json['triple'],
      quadruple: json['Quadruple'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'single': single,
      'double': double,
      'triple': triple,
      'Quadruple': quadruple,
    };
  }
}

class Price {
  num shownPrice;
  num? exactPrice;
  num? discount;
  num? finalPrice;

  Price({
    required this.shownPrice,
    this.exactPrice,
    this.discount,
    this.finalPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      shownPrice: json['shownPrice'],
      exactPrice: json['exactPrice'],
      discount: json['discount'],
      finalPrice: json['finalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shownPrice': shownPrice,
      'exactPrice': exactPrice,
      'discount': discount,
      'finalPrice': finalPrice,
    };
  }
}

class Advance {
  num? amount;
  String? reference;
  bool? isPaid;

  Advance({
    this.amount,
    this.reference,
    this.isPaid,
  });

  factory Advance.fromJson(Map<String, dynamic> json) {
    return Advance(
      amount: json['amount'],
      reference: json['reference'],
      isPaid: json['isPaid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'reference': reference,
      'isPaid': isPaid,
    };
  }
}

class Option {
  String name;
  num amount;

  Option({
    required this.name,
    required this.amount,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      name: json['name'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
    };
  }
}









// class Package {
//   final String roundTrip;
//
//   Package({required this.roundTrip});
//
//   Map<String, dynamic> toJson() {
//     return {'roundTrip': roundTrip};
//   }
// }
