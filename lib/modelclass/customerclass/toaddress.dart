// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToAddress {
  String? firstName;
  String? lastName;
  String? toAddress;
  String? toLocality;
  String? toCity;
  String? toState;
  String? pincode;

  ToAddress({
    this.firstName,
    this.lastName,
    this.toAddress,
    this.toLocality,
    this.toCity,
    this.toState,
    this.pincode,
  });

  // fromJson method
  factory ToAddress.fromJson(Map<String, dynamic> json) {
    return ToAddress(
      firstName: json['firstName'],
      lastName: json['lastName'],
      toAddress: json['toAddress'],
      toLocality: json['toLocality'],
      toCity: json['toCity'],
      toState: json['toState'],
      pincode: json['pincode'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'toAddress': toAddress,
      'toLocality': toLocality,
      'toCity': toCity,
      'toState': toState,
      'pincode': pincode,
    };
  }
}
