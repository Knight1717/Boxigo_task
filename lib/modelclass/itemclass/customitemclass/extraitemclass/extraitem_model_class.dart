// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExtraItems {
  String? id;
  String? itemName;
  String? itemDescription;
  String? itemHeight;
  String? itemLength;
  String? itemWidth;

  ExtraItems({
    this.id,
    this.itemName,
    this.itemDescription,
    this.itemHeight,
    this.itemLength,
    this.itemWidth,
  });

  // fromJson method
  factory ExtraItems.fromJson(Map<String, dynamic> json) {
    return ExtraItems(
      id: json['id'],
      itemName: json['item_name'],
      itemDescription: json['item_description'],
      itemHeight: json['item_height'],
      itemLength: json['item_length'],
      itemWidth: json['item_width'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item_name': itemName,
      'item_description': itemDescription,
      'item_height': itemHeight,
      'item_length': itemLength,
      'item_width': itemWidth,
    };
  }
}
