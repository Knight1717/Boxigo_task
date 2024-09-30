import 'package:banglore_task_app/modelclass/customerclass/fromaddress.dart';
import 'package:banglore_task_app/modelclass/customerclass/toaddress.dart';
import 'package:banglore_task_app/modelclass/itemclass/item_model_class.dart';



class CustomerEstimateFlow {
  String? estimate_id;
  String? moving_from;
  String? moving_to;
  String? moving_on;
  String? distance;
  String? property_size;
  String? old_floor_no;
  String? new_floor_no;
  String? old_elevator_availability;
  String? new_elevator_availability;
  String? old_parking_distance;
  String? new_parking_distance;
  String? unpacking_service;
  String? packing_service;
  Items? items; // Assuming Items is a class
  String? old_house_additional_info;
  String? new_house_additional_info;
  String? total_items;
  String? order_date;
  FromAddress? from_address; // Assuming FromAddress is a class
  ToAddress? to_address; // Assuming ToAddress is a class

  CustomerEstimateFlow({
    this.estimate_id,
    this.moving_from,
    this.moving_to,
    this.moving_on,
    this.distance,
    this.property_size,
    this.old_floor_no,
    this.new_floor_no,
    this.old_elevator_availability,
    this.new_elevator_availability,
    this.old_parking_distance,
    this.new_parking_distance,
    this.unpacking_service,
    this.packing_service,
    this.items,
    this.old_house_additional_info,
    this.new_house_additional_info,
    this.total_items,
    this.order_date,
    this.from_address,
    this.to_address,
  });

  // fromJson method
  factory CustomerEstimateFlow.fromJson(Map<String, dynamic> json) {
    return CustomerEstimateFlow(
      estimate_id: json['estimate_id'] as String?,
      moving_from: json['moving_from'] as String?,
      moving_to: json['moving_to'] as String?,
      moving_on: json['moving_on'] as String?,
      distance: json['distance'] as String?,
      property_size: json['property_size'] as String?,
      old_floor_no: json['old_floor_no'] as String?,
      new_floor_no: json['new_floor_no'] as String?,
      old_elevator_availability: json['old_elevator_availability'] as String?,
      new_elevator_availability: json['new_elevator_availability'] as String?,
      old_parking_distance: json['old_parking_distance'] as String?,
      new_parking_distance: json['new_parking_distance'] as String?,
      unpacking_service: json['unpacking_service'] as String?,
      packing_service: json['packing_service'] as String?,
      items: json['items'] != null ? Items.fromJson(json['items']) : null,
      old_house_additional_info: json['old_house_additional_info'] as String?,
      new_house_additional_info: json['new_house_additional_info'] as String?,
      total_items: json['total_items'] as String?,
      order_date: json['order_date'] as String?,
      from_address: json['from_address'] != null ? FromAddress.fromJson(json['from_address']) : null,
      to_address: json['to_address'] != null ? ToAddress.fromJson(json['to_address']) : null,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'estimate_id': estimate_id,
      'moving_from': moving_from,
      'moving_to': moving_to,
      'moving_on': moving_on,
      'distance': distance,
      'property_size': property_size,
      'old_floor_no': old_floor_no,
      'new_floor_no': new_floor_no,
      'old_elevator_availability': old_elevator_availability,
      'new_elevator_availability': new_elevator_availability,
      'old_parking_distance': old_parking_distance,
      'new_parking_distance': new_parking_distance,
      'unpacking_service': unpacking_service,
      'packing_service': packing_service,
      'items': items?.toJson(),
      'old_house_additional_info': old_house_additional_info,
      'new_house_additional_info': new_house_additional_info,
      'total_items': total_items,
      'order_date': order_date,
      'from_address': from_address?.toJson(),
      'to_address': to_address?.toJson(),
    };
  }
}
