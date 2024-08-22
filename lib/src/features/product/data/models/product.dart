class GetProduct {
  String id;
  // int quantity;
  String type;
  String? skuId;
  String name;
  String? description;
  String? unit;
  String? measure;
  List<String>? image;
  double price;
  double discountedPrice;
  String discountType;
  double discountValue;
  int min;
  int max;
  String? currency;
  String buttonType;
  String buttonText;

  GetProduct({
    required this.id,
    // this.quantity = 0,
    required this.type,
    this.skuId,
    required this.name,
    this.description,
    this.unit,
    this.measure,
    this.image,
    this.price = 0.0,
    this.discountedPrice = 0.0,
    this.discountType = '',
    this.discountValue = 0.0,
    this.min = 0,
    this.max = 0,
    this.currency,
    this.buttonType = '',
    this.buttonText = '',
  });

  factory GetProduct.fromJson(Map<String, dynamic> json) => GetProduct(
        id: json["id"],
        // quantity: json["quantity"],
        type: json["type"],
        skuId: json["sku_id"],
        name: json["name"],
        description: json["description"],
        unit: json["unit"],
        measure: json["measure"],
        image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
        price: json["price"]?.toDouble() ?? 0.0,
        discountedPrice: json["discounted_price"]?.toDouble() ?? 0.0,
        discountType: json["discount_type"] ?? '',
        discountValue: json["discount_value"]?.toDouble() ?? 0.0,
        min: json["min"] ?? 0,
        max: json["max"] ?? 0,
        currency: json["currency"],
        buttonType: json["button_type"],
        buttonText: json["button_text"],
      );
}
