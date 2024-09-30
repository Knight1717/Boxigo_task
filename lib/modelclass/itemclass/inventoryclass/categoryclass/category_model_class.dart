import 'package:banglore_task_app/modelclass/itemclass/inventoryclass/categoryclass/categoryitemclass/itemcategory_model_class.dart';


class Category {
  String? id;
  int? order;
  String? name;
  String? displayName;
  List<Itemscategory> items;

  Category({
    this.id,
    this.order,
    this.name,
    this.displayName,
    required this.items,
  });

  // fromJson method
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String?,
      order: json['order'] as int?,
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      items: (json['items'] as List)
          .map((item) => Itemscategory.fromJson(item))
          .toList(),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order': order.toString(),
      'name': name,
      'displayName': displayName,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}
