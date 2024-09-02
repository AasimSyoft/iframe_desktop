class AddressModel {
  int? status;
  String? message;
  List<Address>? data;
  String? reload;

  AddressModel({
    this.status,
    this.message,
    this.data,
    this.reload,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Address>.from(json["data"]!.map((x) => Address.fromJson(x))),
        reload: json["reload"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "reload": reload,
      };
}

class Address {
  String? id;
  String? name;
  String? latitude;
  String? longitude;
  String? contactPersonName;
  String? contactPersonPhone;
  String? addressOne;
  String? addressTwo;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  bool? status;
  String? addressType;
  dynamic location;
  bool? datumDefault;
  dynamic email;
  dynamic phoneNumber;
  dynamic ccode;

  Address({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.contactPersonName,
    this.contactPersonPhone,
    this.addressOne,
    this.addressTwo,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.status,
    this.addressType,
    this.location,
    this.datumDefault,
    this.email,
    this.phoneNumber,
    this.ccode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        contactPersonName: json["contact_person_name"],
        contactPersonPhone: json["contact_person_phone"],
        addressOne: json["address_one"],
        addressTwo: json["address_two"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        status: json["status"],
        addressType: json["address_type"],
        location: json["location"],
        datumDefault: json["default"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        ccode: json["ccode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "contact_person_name": contactPersonName,
        "contact_person_phone": contactPersonPhone,
        "address_one": addressOne,
        "address_two": addressTwo,
        "city": city,
        "state": state,
        "country": country,
        "zipcode": zipcode,
        "status": status,
        "address_type": addressType,
        "location": location,
        "default": datumDefault,
        "email": email,
        "phone_number": phoneNumber,
        "ccode": ccode,
      };
}
