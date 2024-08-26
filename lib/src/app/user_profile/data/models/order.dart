class OrdersModel {
  int? status;
  String? message;
  List<Order>? data;
  int? count;
  int? pages;

  OrdersModel({
    this.status,
    this.message,
    this.data,
    this.count,
    this.pages,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Order>.from(json["data"]!.map((x) => Order.fromJson(x))),
        count: json["count"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
        "pages": pages,
      };
}

class Order {
  String? id;
  List<Item>? items;
  bool? isContactActive;
  String? organisation;
  String? department;
  bool? isActive;
  bool? status;
  dynamic deletedAt;
  dynamic deletedBy;
  DateTime? createdAt;
  String? createdBy;
  DateTime? updatedAt;
  String? updatedBy;
  String? user;
  String? sourceType;
  IngAddress? shippingAddress;
  IngAddress? billingAddress;
  int? totalPrice;
  int? discountPrice;
  int? finalPrice;
  int? totalOrderTax;
  AdditionalPrice? taxesDict;
  AdditionalPrice? additionalPrice;
  String? comments;
  String? paymentType;
  String? paymentStatus;
  String? orderId;
  String? mediaUrl;
  String? mediaName;
  int? totalQuantity;
  String? orderStatus;
  String? deliveryStatus;
  String? referenceId;
  String? currency;
  String? currencySymbol;
  String? transactionId;
  UserInfo? userInfo;
  AdditionalPrice? info;
  List<dynamic>? productItems;
  List<dynamic>? additionalInfo;

  Order({
    this.id,
    this.items,
    this.isContactActive,
    this.organisation,
    this.department,
    this.isActive,
    this.status,
    this.deletedAt,
    this.deletedBy,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.user,
    this.sourceType,
    this.shippingAddress,
    this.billingAddress,
    this.totalPrice,
    this.discountPrice,
    this.finalPrice,
    this.totalOrderTax,
    this.taxesDict,
    this.additionalPrice,
    this.comments,
    this.paymentType,
    this.paymentStatus,
    this.orderId,
    this.mediaUrl,
    this.mediaName,
    this.totalQuantity,
    this.orderStatus,
    this.deliveryStatus,
    this.referenceId,
    this.currency,
    this.currencySymbol,
    this.transactionId,
    this.userInfo,
    this.info,
    this.productItems,
    this.additionalInfo,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        isContactActive: json["is_contact_active"],
        organisation: json["organisation"],
        department: json["department"],
        isActive: json["is_active"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        user: json["user"],
        sourceType: json["source_type"],
        shippingAddress: json["shipping_address"] == null
            ? null
            : IngAddress.fromJson(json["shipping_address"]),
        billingAddress: json["billing_address"] == null
            ? null
            : IngAddress.fromJson(json["billing_address"]),
        totalPrice: json["total_price"],
        discountPrice: json["discount_price"],
        finalPrice: json["final_price"],
        totalOrderTax: json["total_order_tax"],
        taxesDict: json["taxes_dict"] == null
            ? null
            : AdditionalPrice.fromJson(json["taxes_dict"]),
        additionalPrice: json["additional_price"] == null
            ? null
            : AdditionalPrice.fromJson(json["additional_price"]),
        comments: json["comments"],
        paymentType: json["payment_type"],
        paymentStatus: json["payment_status"],
        orderId: json["order_id"],
        mediaUrl: json["media_url"],
        mediaName: json["media_name"],
        totalQuantity: json["total_quantity"],
        orderStatus: json["order_status"],
        deliveryStatus: json["delivery_status"],
        referenceId: json["reference_id"],
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        transactionId: json["transaction_id"],
        userInfo: json["user_info"] == null
            ? null
            : UserInfo.fromJson(json["user_info"]),
        info: json["info"] == null
            ? null
            : AdditionalPrice.fromJson(json["info"]),
        productItems: json["product_items"] == null
            ? []
            : List<dynamic>.from(json["product_items"]!.map((x) => x)),
        additionalInfo: json["additional_info"] == null
            ? []
            : List<dynamic>.from(json["additional_info"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "is_contact_active": isContactActive,
        "organisation": organisation,
        "department": department,
        "is_active": isActive,
        "status": status,
        "deleted_at": deletedAt,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "updated_by": updatedBy,
        "user": user,
        "source_type": sourceType,
        "shipping_address": shippingAddress?.toJson(),
        "billing_address": billingAddress?.toJson(),
        "total_price": totalPrice,
        "discount_price": discountPrice,
        "final_price": finalPrice,
        "total_order_tax": totalOrderTax,
        "taxes_dict": taxesDict?.toJson(),
        "additional_price": additionalPrice?.toJson(),
        "comments": comments,
        "payment_type": paymentType,
        "payment_status": paymentStatus,
        "order_id": orderId,
        "media_url": mediaUrl,
        "media_name": mediaName,
        "total_quantity": totalQuantity,
        "order_status": orderStatus,
        "delivery_status": deliveryStatus,
        "reference_id": referenceId,
        "currency": currency,
        "currency_symbol": currencySymbol,
        "transaction_id": transactionId,
        "user_info": userInfo?.toJson(),
        "info": info?.toJson(),
        "product_items": productItems == null
            ? []
            : List<dynamic>.from(productItems!.map((x) => x)),
        "additional_info": additionalInfo == null
            ? []
            : List<dynamic>.from(additionalInfo!.map((x) => x)),
      };
}

class AdditionalPrice {
  AdditionalPrice();

  factory AdditionalPrice.fromJson(Map<String, dynamic> json) =>
      AdditionalPrice();

  Map<String, dynamic> toJson() => {};
}

class IngAddress {
  String? id;
  String? city;
  String? name;
  String? state;
  bool? status;
  String? country;
  String? zipcode;
  String? latitude;
  String? longitude;
  String? addressOne;
  String? addressTwo;
  String? addressType;
  String? contactPersonName;
  String? contactPersonPhone;

  IngAddress({
    this.id,
    this.city,
    this.name,
    this.state,
    this.status,
    this.country,
    this.zipcode,
    this.latitude,
    this.longitude,
    this.addressOne,
    this.addressTwo,
    this.addressType,
    this.contactPersonName,
    this.contactPersonPhone,
  });

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        id: json["id"],
        city: json["city"],
        name: json["name"],
        state: json["state"],
        status: json["status"],
        country: json["country"],
        zipcode: json["zipcode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        addressOne: json["address_one"],
        addressTwo: json["address_two"],
        addressType: json["address_type"],
        contactPersonName: json["contact_person_name"],
        contactPersonPhone: json["contact_person_phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "name": name,
        "state": state,
        "status": status,
        "country": country,
        "zipcode": zipcode,
        "latitude": latitude,
        "longitude": longitude,
        "address_one": addressOne,
        "address_two": addressTwo,
        "address_type": addressType,
        "contact_person_name": contactPersonName,
        "contact_person_phone": contactPersonPhone,
      };
}

class Item {
  String? id;
  ItemData? itemData;
  int? quantity;
  String? organisation;
  String? sourceId;
  String? sourceType;
  String? itemStatus;
  DateTime? createdAt;
  String? order;

  Item({
    this.id,
    this.itemData,
    this.quantity,
    this.organisation,
    this.sourceId,
    this.sourceType,
    this.itemStatus,
    this.createdAt,
    this.order,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        itemData: json["item_data"] == null
            ? null
            : ItemData.fromJson(json["item_data"]),
        quantity: json["quantity"],
        organisation: json["organisation"],
        sourceId: json["source_id"],
        sourceType: json["source_type"],
        itemStatus: json["item_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_data": itemData?.toJson(),
        "quantity": quantity,
        "organisation": organisation,
        "source_id": sourceId,
        "source_type": sourceType,
        "item_status": itemStatus,
        "created_at": createdAt?.toIso8601String(),
        "order": order,
      };
}

class ItemData {
  String? id;
  String? type;
  int? price;
  String? product;
  dynamic variant;
  int? itemTax;
  int? quantity;
  String? itemName;
  String? itemImage;
  String? discountType;
  int? discountValue;
  bool? availableStatus;
  int? discountedPrice;
  int? itemOverallTax;
  int? itemTotalPrice;
  AdditionalPrice? particularTaxValues;
  int? itemTotalDiscountedPrice;

  ItemData({
    this.id,
    this.type,
    this.price,
    this.product,
    this.variant,
    this.itemTax,
    this.quantity,
    this.itemName,
    this.itemImage,
    this.discountType,
    this.discountValue,
    this.availableStatus,
    this.discountedPrice,
    this.itemOverallTax,
    this.itemTotalPrice,
    this.particularTaxValues,
    this.itemTotalDiscountedPrice,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        id: json["id"],
        type: json["type"],
        price: json["price"],
        product: json["product"],
        variant: json["variant"],
        itemTax: json["item_tax"],
        quantity: json["quantity"],
        itemName: json["item_name"],
        itemImage: json["item_image"],
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        availableStatus: json["available_status"],
        discountedPrice: json["discounted_price"],
        itemOverallTax: json["item_overall_tax"],
        itemTotalPrice: json["item_total_price"],
        particularTaxValues: json["particular_tax_values"] == null
            ? null
            : AdditionalPrice.fromJson(json["particular_tax_values"]),
        itemTotalDiscountedPrice: json["item_total_discounted_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "price": price,
        "product": product,
        "variant": variant,
        "item_tax": itemTax,
        "quantity": quantity,
        "item_name": itemName,
        "item_image": itemImage,
        "discount_type": discountType,
        "discount_value": discountValue,
        "available_status": availableStatus,
        "discounted_price": discountedPrice,
        "item_overall_tax": itemOverallTax,
        "item_total_price": itemTotalPrice,
        "particular_tax_values": particularTaxValues?.toJson(),
        "item_total_discounted_price": itemTotalDiscountedPrice,
      };
}

class UserInfo {
  String? id;
  String? ccode;
  String? email;
  String? fname;
  String? image;
  String? lname;
  String? utype;
  String? organisation;
  String? phoneNumber;

  UserInfo({
    this.id,
    this.ccode,
    this.email,
    this.fname,
    this.image,
    this.lname,
    this.utype,
    this.organisation,
    this.phoneNumber,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        ccode: json["ccode"],
        email: json["email"],
        fname: json["fname"],
        image: json["image"],
        lname: json["lname"],
        utype: json["utype"],
        organisation: json["organisation"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ccode": ccode,
        "email": email,
        "fname": fname,
        "image": image,
        "lname": lname,
        "utype": utype,
        "organisation": organisation,
        "phone_number": phoneNumber,
      };
}
