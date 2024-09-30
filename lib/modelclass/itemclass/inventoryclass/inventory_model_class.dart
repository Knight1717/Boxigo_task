import 'categoryclass/category_model_class.dart';

class Inventory {
  String? id;
  int? order;
  String? name;
  String? displayName;
  List<Category>? category;

  Inventory({this.id, this.order, this.name, this.displayName, this.category});

  Inventory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['order'] is String) {
      order = int.tryParse(json['order']);  // Convert to int if it's a String
    } else {
      order = json['order'];  // Directly assign if it's already an int
    }
    name = json['name'];
    displayName = json['displayName'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }else{
      category = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order'] = order?.toString();
    data['name'] = name;
    data['displayName'] = displayName;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}