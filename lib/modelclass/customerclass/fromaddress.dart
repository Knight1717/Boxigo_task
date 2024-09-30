// ignore_for_file: public_member_api_docs, sort_constructors_first
class FromAddress {
  String? firstName;
  String? lastName;
  String? fromAddress;
  String? fromLocality;
  String? fromCity;
  String? fromState;
  String? pincode;

  FromAddress({
    this.firstName,
    this.lastName,
    this.fromAddress,
    this.fromLocality,
    this.fromCity,
    this.fromState,
    this.pincode,
  });

  // fromJson method
  factory FromAddress.fromJson(Map<String, dynamic> json) {
    return FromAddress(
      firstName: json['firstName'],
      lastName: json['lastName'],
      fromAddress: json['fromAddress'],
      fromLocality: json['fromLocality'],
      fromCity: json['fromCity'],
      fromState: json['fromState'],
      pincode: json['pincode'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'fromAddress': fromAddress,
      'fromLocality': fromLocality,
      'fromCity': fromCity,
      'fromState': fromState,
      'pincode': pincode,
    };
  }
}
