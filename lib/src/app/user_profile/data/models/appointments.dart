import 'user.dart';

class MyAppointment {
  int? count;
  int? status;
  String? message;
  List<Appointment>? appointment;
  int? page;

  MyAppointment({
    this.count,
    this.status,
    this.message,
    this.appointment,
    this.page,
  });

  factory MyAppointment.fromJson(Map<String, dynamic> json) => MyAppointment(
        count: json["count"],
        status: json["status"],
        message: json["message"],
        appointment: json["data"] == null
            ? []
            : List<Appointment>.from(
                json["data"]!.map((x) => Appointment.fromJson(x))),
        page: json["page"],
      );
}

class Appointment {
  String? id;
  String? date;
  AppointmentInfo? info;
  String? appointmentStatus;
  dynamic customerAddressId;
  String? customerId;
  String? slot;
  String? displayBookingId;
  bool? isPaid;
  dynamic meetingInfo;
  String? meetingType;
  dynamic orgAddressId;
  String? paymentMode;
  String? paymentStatus;
  String? staffId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? amount;
  String? sourceType;
  String? currency;
  String? timeZone;
  List<MyQuestionnaire>? questionnaire;
  String? userTimeZone;
  AmountInfo? amountInfo;
  String? meetingLink;
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
    this.amount,
    this.sourceType,
    this.currency,
    this.timeZone,
    this.questionnaire,
    this.userTimeZone,
    this.amountInfo,
    this.meetingLink,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        date: json["date"],
        info: json["info"] == null
            ? null
            : AppointmentInfo.fromJson(json["info"]),
        appointmentStatus: json["appointment_status"],
        customerAddressId: json["customer_address_id"],
        customerId: json["customer_id"],
        slot: json["slot"],
        displayBookingId: json["display_booking_id"],
        isPaid: json["is_paid"],
        meetingInfo: json["meeting_info"],
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
        amount: json["amount"],
        sourceType: json["source_type"],
        currency: json["currency"],
        timeZone: json["time_zone"],
        questionnaire: json["questionnaire"] == null
            ? null
            : List<MyQuestionnaire>.from(
                json["questionnaire"].map((x) => MyQuestionnaire.fromJson(x))),
        userTimeZone: json["user_time_zone"],
        amountInfo: json["amount_info"] == null
            ? null
            : AmountInfo.fromJson(json["amount_info"]),
        meetingLink: json["customer_twilio_meeting_url"],
      );
}

class AppointmentInfo {
  User? user;
  Staff? staff;
  String? address;

  AppointmentInfo({
    this.user,
    this.staff,
    this.address,
  });

  factory AppointmentInfo.fromJson(Map<String, dynamic> json) =>
      AppointmentInfo(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        staff: json["staff"] == null ? null : Staff.fromJson(json["staff"]),
        // address: json["address"],
      );
}

class Staff {
  String? staffId;
  String? staffName;
  double? staffPrice;

  Staff({
    this.staffId,
    this.staffName,
    this.staffPrice,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        staffId: json["staffId"],
        staffName: json["staffName"],
        staffPrice: json["staffPrice"]?.toDouble(),
      );
}

class MyQuestionnaire {
  String? id;
  String? answer;
  String? question;
  String? questionType;

  MyQuestionnaire({
    this.id,
    this.answer,
    this.question,
    this.questionType,
  });

  factory MyQuestionnaire.fromJson(Map<String, dynamic> json) =>
      MyQuestionnaire(
        id: json["id"],
        answer: json["answer"],
        question: json["question"],
        questionType: json["question_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
        "question": question,
        "question_type": questionType,
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
