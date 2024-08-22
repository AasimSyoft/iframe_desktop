class UserModel {
  User? user;

  UserModel({
    this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json["data"] == null ? null : User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": user?.toJson(),
      };
}

class User {
  String? id;
  String? fname;
  String? lname;
  String? email;
  String? phoneNumber;
  String? ccode;
  String? image;
  String? utype;
  String? organisation;
  String? token;

  User({
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.phoneNumber,
    this.ccode,
    this.image,
    this.utype,
    this.organisation,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        ccode: json["ccode"],
        image: json["image"],
        utype: json["utype"],
        organisation: json["organisation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone_number": phoneNumber,
        "ccode": ccode,
        "image": image,
        "utype": utype,
        "organisation": organisation,
      };
}
