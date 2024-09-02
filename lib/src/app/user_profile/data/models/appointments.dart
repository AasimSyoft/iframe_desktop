class MyAppointment {
  int? count;
  dynamic next;
  dynamic previous;
  int? status;
  String? message;
  List<Appointment>? data;
  int? page;

  MyAppointment({
    this.count,
    this.next,
    this.previous,
    this.status,
    this.message,
    this.data,
    this.page,
  });

  factory MyAppointment.fromJson(Map<String, dynamic> json) => MyAppointment(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Appointment>.from(
                json["data"]!.map((x) => Appointment.fromJson(x))),
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "page": page,
      };
}

class Appointment {
  String? id;
  String? date;
  DatumInfo? info;
  String? appointmentStatus;
  dynamic customerAddressId;
  String? customerId;
  String? slot;
  String? displayBookingId;
  bool? isPaid;
  MeetingInfo? meetingInfo;
  String? meetingType;
  String? orgAddressId;
  String? paymentMode;
  String? paymentStatus;
  dynamic staffId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ConsultationId? consultationId;
  int? amount;
  String? sourceType;
  List<dynamic>? questionnaire;
  String? contactId;
  String? currency;
  String? amountInDecimal;
  DateTime? staffTimezoneDate;
  String? staffTimezoneTime;
  String? timeZone;
  List<Billed>? billedFrom;
  List<Billed>? billedTo;
  String? userTimeZone;
  String? invoiceMediaUrl;
  AmountInfo? amountInfo;
  String? customerTwilioMeetingUrl;
  String? refId;
  String? onlineMeetingMedium;
  String? videoMeetingUrl;

  Appointment({
    this.id,
    this.date,
    this.info,
    this.appointmentStatus,
    this.customerAddressId,
    this.customerId,
    this.slot,
    this.displayBookingId,
    this.isPaid,
    this.meetingInfo,
    this.meetingType,
    this.orgAddressId,
    this.paymentMode,
    this.paymentStatus,
    this.staffId,
    this.createdAt,
    this.updatedAt,
    this.consultationId,
    this.amount,
    this.sourceType,
    this.questionnaire,
    this.contactId,
    this.currency,
    this.amountInDecimal,
    this.staffTimezoneDate,
    this.staffTimezoneTime,
    this.timeZone,
    this.billedFrom,
    this.billedTo,
    this.userTimeZone,
    this.invoiceMediaUrl,
    this.amountInfo,
    this.customerTwilioMeetingUrl,
    this.refId,
    this.onlineMeetingMedium,
    this.videoMeetingUrl,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        date: json["date"],
        info: json["info"] == null ? null : DatumInfo.fromJson(json["info"]),
        appointmentStatus: json["appointment_status"],
        customerAddressId: json["customer_address_id"],
        customerId: json["customer_id"],
        slot: json["slot"],
        displayBookingId: json["display_booking_id"],
        isPaid: json["is_paid"],
        meetingInfo: json["meeting_info"] == null
            ? null
            : MeetingInfo.fromJson(json["meeting_info"]),
        meetingType: json["meeting_type"],
        orgAddressId: json["org_address_id"],
        paymentMode: json["payment_mode"],
        paymentStatus: json["payment_status"],
        staffId: json["staff_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        consultationId: json["consultation_id"] == null
            ? null
            : ConsultationId.fromJson(json["consultation_id"]),
        amount: json["amount"],
        sourceType: json["source_type"],
        questionnaire: json["questionnaire"] == null
            ? []
            : List<dynamic>.from(json["questionnaire"]!.map((x) => x)),
        contactId: json["contact_id"],
        currency: json["currency"],
        amountInDecimal: json["amount_in_decimal"],
        staffTimezoneDate: json["staff_timezone_date"] == null
            ? null
            : DateTime.parse(json["staff_timezone_date"]),
        staffTimezoneTime: json["staff_timezone_time"],
        timeZone: json["time_zone"],
        billedFrom: json["billed_from"] == null
            ? []
            : List<Billed>.from(
                json["billed_from"]!.map((x) => Billed.fromJson(x))),
        billedTo: json["billed_to"] == null
            ? []
            : List<Billed>.from(
                json["billed_to"]!.map((x) => Billed.fromJson(x))),
        userTimeZone: json["user_time_zone"],
        invoiceMediaUrl: json["invoice_media_url"],
        amountInfo: json["amount_info"] == null
            ? null
            : AmountInfo.fromJson(json["amount_info"]),
        customerTwilioMeetingUrl: json["customer_twilio_meeting_url"],
        refId: json["ref_id"],
        onlineMeetingMedium: json["online_meeting_medium"],
        videoMeetingUrl: json["video_meeting_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "info": info?.toJson(),
        "appointment_status": appointmentStatus,
        "customer_address_id": customerAddressId,
        "customer_id": customerId,
        "slot": slot,
        "display_booking_id": displayBookingId,
        "is_paid": isPaid,
        "meeting_info": meetingInfo?.toJson(),
        "meeting_type": meetingType,
        "org_address_id": orgAddressId,
        "payment_mode": paymentMode,
        "payment_status": paymentStatus,
        "staff_id": staffId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "consultation_id": consultationId?.toJson(),
        "amount": amount,
        "source_type": sourceType,
        "questionnaire": questionnaire == null
            ? []
            : List<dynamic>.from(questionnaire!.map((x) => x)),
        "contact_id": contactId,
        "currency": currency,
        "amount_in_decimal": amountInDecimal,
        "staff_timezone_date":
            "${staffTimezoneDate!.year.toString().padLeft(4, '0')}-${staffTimezoneDate!.month.toString().padLeft(2, '0')}-${staffTimezoneDate!.day.toString().padLeft(2, '0')}",
        "staff_timezone_time": staffTimezoneTime,
        "time_zone": timeZone,
        "billed_from": billedFrom == null
            ? []
            : List<dynamic>.from(billedFrom!.map((x) => x.toJson())),
        "billed_to": billedTo == null
            ? []
            : List<dynamic>.from(billedTo!.map((x) => x.toJson())),
        "user_time_zone": userTimeZone,
        "invoice_media_url": invoiceMediaUrl,
        "amount_info": amountInfo?.toJson(),
        "customer_twilio_meeting_url": customerTwilioMeetingUrl,
        "ref_id": refId,
        "online_meeting_medium": onlineMeetingMedium,
        "video_meeting_url": videoMeetingUrl,
      };
}

class AmountInfo {
  String? tax;
  String? price;
  String? discount;
  int? quantity;
  String? itemName;
  String? finalPrice;
  String? staffPrice;

  AmountInfo({
    this.tax,
    this.price,
    this.discount,
    this.quantity,
    this.itemName,
    this.finalPrice,
    this.staffPrice,
  });

  factory AmountInfo.fromJson(Map<String, dynamic> json) => AmountInfo(
        tax: json["tax"],
        price: json["price"],
        discount: json["discount"],
        quantity: json["quantity"],
        itemName: json["item_name"],
        finalPrice: json["final_price"],
        staffPrice: json["staff_price"],
      );

  Map<String, dynamic> toJson() => {
        "tax": tax,
        "price": price,
        "discount": discount,
        "quantity": quantity,
        "item_name": itemName,
        "final_price": finalPrice,
        "staff_price": staffPrice,
      };
}

class Billed {
  String? name;
  String? value;

  Billed({
    this.name,
    this.value,
  });

  factory Billed.fromJson(Map<String, dynamic> json) => Billed(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class ConsultationId {
  String? id;
  bool? questionnaireAdded;
  bool? status;
  bool? isActive;
  String? organisation;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? createdBy;
  dynamic deletedBy;
  String? updatedBy;
  ConsultationIdInfo? info;
  String? name;
  String? description;
  dynamic image;
  List<String>? images;
  String? duration;
  String? currency;
  String? timeZone;
  bool? isStaffEnabled;
  bool? staffRelated;
  dynamic badge;
  List<dynamic>? tax;
  String? categoryId;

  ConsultationId({
    this.id,
    this.questionnaireAdded,
    this.status,
    this.isActive,
    this.organisation,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.deletedBy,
    this.updatedBy,
    this.info,
    this.name,
    this.description,
    this.image,
    this.images,
    this.duration,
    this.currency,
    this.timeZone,
    this.isStaffEnabled,
    this.staffRelated,
    this.badge,
    this.tax,
    this.categoryId,
  });

  factory ConsultationId.fromJson(Map<String, dynamic> json) => ConsultationId(
        id: json["id"],
        questionnaireAdded: json["questionnaire_added"],
        status: json["status"],
        isActive: json["is_active"],
        organisation: json["organisation"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        createdBy: json["created_by"],
        deletedBy: json["deleted_by"],
        updatedBy: json["updated_by"],
        info: json["info"] == null
            ? null
            : ConsultationIdInfo.fromJson(json["info"]),
        name: json["name"],
        description: json["description"],
        image: json["image"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        duration: json["duration"],
        currency: json["currency"],
        timeZone: json["time_zone"],
        isStaffEnabled: json["is_staff_enabled"],
        staffRelated: json["staff_related"],
        badge: json["badge"],
        tax: json["tax"] == null
            ? []
            : List<dynamic>.from(json["tax"]!.map((x) => x)),
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "questionnaire_added": questionnaireAdded,
        "status": status,
        "is_active": isActive,
        "organisation": organisation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "created_by": createdBy,
        "deleted_by": deletedBy,
        "updated_by": updatedBy,
        "info": info?.toJson(),
        "name": name,
        "description": description,
        "image": image,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "duration": duration,
        "currency": currency,
        "time_zone": timeZone,
        "is_staff_enabled": isStaffEnabled,
        "staff_related": staffRelated,
        "badge": badge,
        "tax": tax == null ? [] : List<dynamic>.from(tax!.map((x) => x)),
        "category_id": categoryId,
      };
}

class ConsultationIdInfo {
  ConsultationIdInfo();

  factory ConsultationIdInfo.fromJson(Map<String, dynamic> json) =>
      ConsultationIdInfo();

  Map<String, dynamic> toJson() => {};
}

class DatumInfo {
  User? user;
  Staff? staff;
  Address? address;
  OrgInfo? orgInfo;

  DatumInfo({
    this.user,
    this.staff,
    this.address,
    this.orgInfo,
  });

  factory DatumInfo.fromJson(Map<String, dynamic> json) => DatumInfo(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        staff: json["staff"] == null ? null : Staff.fromJson(json["staff"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        orgInfo: json["org_info"] == null
            ? null
            : OrgInfo.fromJson(json["org_info"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "staff": staff?.toJson(),
        "address": address?.toJson(),
        "org_info": orgInfo?.toJson(),
      };
}

class Address {
  String? id;
  String? name;
  bool? status;
  bool? addressDefault;
  String? location;

  Address({
    this.id,
    this.name,
    this.status,
    this.addressDefault,
    this.location,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        addressDefault: json["default"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "default": addressDefault,
        "location": location,
      };
}

class OrgInfo {
  String? name;

  OrgInfo({
    this.name,
  });

  factory OrgInfo.fromJson(Map<String, dynamic> json) => OrgInfo(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Staff {
  dynamic staffId;
  dynamic staffName;
  dynamic staffPrice;

  Staff({
    this.staffId,
    this.staffName,
    this.staffPrice,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        staffId: json["staffId"],
        staffName: json["staffName"],
        staffPrice: json["staffPrice"],
      );

  Map<String, dynamic> toJson() => {
        "staffId": staffId,
        "staffName": staffName,
        "staffPrice": staffPrice,
      };
}

class User {
  String? id;
  String? ccode;
  String? email;
  String? fname;
  String? lname;
  String? utype;
  String? contactId;
  String? organisation;
  String? phoneNumber;

  User({
    this.id,
    this.ccode,
    this.email,
    this.fname,
    this.lname,
    this.utype,
    this.contactId,
    this.organisation,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        ccode: json["ccode"],
        email: json["email"],
        fname: json["fname"],
        lname: json["lname"],
        utype: json["utype"],
        contactId: json["contact_id"],
        organisation: json["organisation"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ccode": ccode,
        "email": email,
        "fname": fname,
        "lname": lname,
        "utype": utype,
        "contact_id": contactId,
        "organisation": organisation,
        "phone_number": phoneNumber,
      };
}

class MeetingInfo {
  String? joinUrl;

  MeetingInfo({
    this.joinUrl,
  });

  factory MeetingInfo.fromJson(Map<String, dynamic> json) => MeetingInfo(
        joinUrl: json["join_url"],
      );

  Map<String, dynamic> toJson() => {
        "join_url": joinUrl,
      };
}
