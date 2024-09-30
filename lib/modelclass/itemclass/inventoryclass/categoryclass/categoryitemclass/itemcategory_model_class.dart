class Itemscategory {
  String? typeOptions;

  Itemscategory({this.typeOptions});

  // fromJson method
  factory Itemscategory.fromJson(Map<String, dynamic> json) {
    return Itemscategory(
      typeOptions: json['typeOptions'] as String?,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'typeOptions': typeOptions,
    };
  }
}
