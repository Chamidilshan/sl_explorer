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

// class Package {
//   final String roundTrip;
//
//   Package({required this.roundTrip});
//
//   Map<String, dynamic> toJson() {
//     return {'roundTrip': roundTrip};
//   }
// }
