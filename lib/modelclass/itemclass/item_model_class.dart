import 'customitemclass/customitem_model_class.dart';
import 'inventoryclass/inventory_model_class.dart';

class Items {
  List<Inventory>? inventory;
  CustomItems? customItems;

  Items({
    this.inventory,
    this.customItems,
  });

  // fromJson method
  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      inventory: (json['inventory'] as List<dynamic>?)
          ?.map((e) => Inventory.fromJson(e as Map<String, dynamic>))
          .toList(),
      customItems: json['customItems'] != null
          ? CustomItems.fromJson(json['customItems'])
          : null,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'inventory': inventory?.map((e) => e.toJson()).toList(),
      'customItems': customItems?.toJson(),
    };
  }
}
