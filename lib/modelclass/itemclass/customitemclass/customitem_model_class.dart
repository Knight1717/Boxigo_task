// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'extraitemclass/extraitem_model_class.dart';

class CustomItems {
  List<ExtraItems>? items;

  CustomItems({
    this.items,
  });

  // fromJson method
  factory CustomItems.fromJson(Map<String, dynamic> json) {
    return CustomItems(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ExtraItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((e) => e.toJson()).toList(),
    };
  }
}
