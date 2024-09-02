class CartModel {
  int? status;
  String? message;
  Cart? data;
  int? count;
  int? pages;

  CartModel({
    this.status,
    this.message,
    this.data,
    this.count,
    this.pages,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Cart.fromJson(json["data"]),
        count: json["count"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "count": count,
        "pages": pages,
      };
}

class Cart {
  int? totalQuantity;
  int? totalCartPrice;
  int? totalCartDiscountedPrice;
  int? totalCartDiscountAmount;
  int? totalCartTaxAmount;
  int? overallCartValue;
  List<CartItem>? cartItems;
  TaxesDict? taxesDict;

  Cart({
    this.totalQuantity,
    this.totalCartPrice,
    this.totalCartDiscountedPrice,
    this.totalCartDiscountAmount,
    this.totalCartTaxAmount,
    this.overallCartValue,
    this.cartItems,
    this.taxesDict,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        totalQuantity: json["total_quantity"],
        totalCartPrice: json["total_cart_price"],
        totalCartDiscountedPrice: json["total_cart_discounted_price"],
        totalCartDiscountAmount: json["total_cart_discount_amount"],
        totalCartTaxAmount: json["total_cart_tax_amount"],
        overallCartValue: json["overall_cart_value"],
        cartItems: json["cart_items"] == null
            ? []
            : List<CartItem>.from(
                json["cart_items"]!.map((x) => CartItem.fromJson(x))),
        taxesDict: json["taxes_dict"] == null
            ? null
            : TaxesDict.fromJson(json["taxes_dict"]),
      );

  Map<String, dynamic> toJson() => {
        "total_quantity": totalQuantity,
        "total_cart_price": totalCartPrice,
        "total_cart_discounted_price": totalCartDiscountedPrice,
        "total_cart_discount_amount": totalCartDiscountAmount,
        "total_cart_tax_amount": totalCartTaxAmount,
        "overall_cart_value": overallCartValue,
        "cart_items": cartItems == null
            ? []
            : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
        "taxes_dict": taxesDict?.toJson(),
      };
}

class CartItem {
  String? id;
  String? product;
  dynamic variant;
  String? itemName;
  String? itemImage;
  int? quantity;
  bool? availableStatus;
  String? type;
  int? price;
  String? discountType;
  int? discountValue;
  int? discountedPrice;
  int? itemTotalPrice;
  int? itemTotalDiscountedPrice;
  TaxesDict? particularTaxValues;
  int? itemTax;
  int? itemOverallTax;

  CartItem({
    this.id,
    this.product,
    this.variant,
    this.itemName,
    this.itemImage,
    this.quantity,
    this.availableStatus,
    this.type,
    this.price,
    this.discountType,
    this.discountValue,
    this.discountedPrice,
    this.itemTotalPrice,
    this.itemTotalDiscountedPrice,
    this.particularTaxValues,
    this.itemTax,
    this.itemOverallTax,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        product: json["product"],
        variant: json["variant"],
        itemName: json["item_name"],
        itemImage: json["item_image"],
        quantity: json["quantity"],
        availableStatus: json["available_status"],
        type: json["type"],
        price: json["price"],
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        discountedPrice: json["discounted_price"],
        itemTotalPrice: json["item_total_price"],
        itemTotalDiscountedPrice: json["item_total_discounted_price"],
        particularTaxValues: json["particular_tax_values"] == null
            ? null
            : TaxesDict.fromJson(json["particular_tax_values"]),
        itemTax: json["item_tax"],
        itemOverallTax: json["item_overall_tax"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "variant": variant,
        "item_name": itemName,
        "item_image": itemImage,
        "quantity": quantity,
        "available_status": availableStatus,
        "type": type,
        "price": price,
        "discount_type": discountType,
        "discount_value": discountValue,
        "discounted_price": discountedPrice,
        "item_total_price": itemTotalPrice,
        "item_total_discounted_price": itemTotalDiscountedPrice,
        "particular_tax_values": particularTaxValues?.toJson(),
        "item_tax": itemTax,
        "item_overall_tax": itemOverallTax,
      };
}

class TaxesDict {
  TaxesDict();

  factory TaxesDict.fromJson(Map<String, dynamic> json) => TaxesDict();

  Map<String, dynamic> toJson() => {};
}
