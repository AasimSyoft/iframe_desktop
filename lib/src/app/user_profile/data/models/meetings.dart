class MeetingsModel {
  int? status;
  String? message;
  List<Meeting>? data;
  int? count;
  int? page;
  int? pages;

  MeetingsModel({
    this.status,
    this.message,
    this.data,
    this.count,
    this.page,
    this.pages,
  });

  factory MeetingsModel.fromJson(Map<String, dynamic> json) => MeetingsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Meeting>.from(json["data"]!.map((x) => Meeting.fromJson(x))),
        count: json["count"],
        page: json["page"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
        "page": page,
        "pages": pages,
      };
}

class Meeting {
  String? id;
  String? title;
  DateTime? startStr;
  DateTime? endStr;
  String? enduserTimezone;
  List<BookingDetail>? bookingDetails;
  String? organisation;
  String? department;
  bool? isActive;
  bool? status;
  dynamic deletedAt;
  dynamic deletedBy;
  DateTime? createdAt;
  dynamic createdBy;
  DateTime? updatedAt;
  dynamic updatedBy;
  Info? info;
  String? bookingStatus;
  String? bookingName;
  int? duration;
  DateTime? date;
  String? startTime;
  String? endTime;
  String? staff;
  String? staffName;
  String? name;
  String? email;
  List<GuestEmail>? guestEmail;
  String? meetingId;
  String? description;
  String? bookingId;
  String? appointmentId;
  String? staffTimezone;
  String? timeZone;
  DateTime? bookingStartTime;
  DateTime? bookingEndTime;
  String? type;
  String? meetingLink;
  String? ccode;
  String? phoneNumber;
  String? company;
  String? contactId;
  String? userId;
  List<dynamic>? rescheduleHistory;
  String? staffEmail;
  List<dynamic>? customerMeetingReminderEventSchedulerDetails;
  List<dynamic>? staffMeetingReminderEventSchedulerDetails;

  Meeting({
    this.id,
    this.title,
    this.startStr,
    this.endStr,
    this.enduserTimezone,
    this.bookingDetails,
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
    this.info,
    this.bookingStatus,
    this.bookingName,
    this.duration,
    this.date,
    this.startTime,
    this.endTime,
    this.staff,
    this.staffName,
    this.name,
    this.email,
    this.guestEmail,
    this.meetingId,
    this.description,
    this.bookingId,
    this.appointmentId,
    this.staffTimezone,
    this.timeZone,
    this.bookingStartTime,
    this.bookingEndTime,
    this.type,
    this.meetingLink,
    this.ccode,
    this.phoneNumber,
    this.company,
    this.contactId,
    this.userId,
    this.rescheduleHistory,
    this.staffEmail,
    this.customerMeetingReminderEventSchedulerDetails,
    this.staffMeetingReminderEventSchedulerDetails,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        id: json["id"],
        title: json["title"],
        startStr:
            json["startStr"] == null ? null : DateTime.parse(json["startStr"]),
        endStr: json["endStr"] == null ? null : DateTime.parse(json["endStr"]),
        enduserTimezone: json["enduser_timezone"],
        bookingDetails: json["booking_details"] == null
            ? []
            : List<BookingDetail>.from(
                json["booking_details"]!.map((x) => BookingDetail.fromJson(x))),
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
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        bookingStatus: json["booking_status"],
        bookingName: json["booking_name"],
        duration: json["duration"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        staff: json["staff"],
        staffName: json["staff_name"],
        name: json["name"],
        email: json["email"],
        guestEmail: json["guest_email"] == null
            ? []
            : List<GuestEmail>.from(
                json["guest_email"]!.map((x) => GuestEmail.fromJson(x))),
        meetingId: json["meeting_id"],
        description: json["description"],
        bookingId: json["booking_id"],
        appointmentId: json["appointment_id"],
        staffTimezone: json["staff_timezone"],
        timeZone: json["time_zone"],
        bookingStartTime: json["booking_start_time"] == null
            ? null
            : DateTime.parse(json["booking_start_time"]),
        bookingEndTime: json["booking_end_time"] == null
            ? null
            : DateTime.parse(json["booking_end_time"]),
        type: json["type"],
        meetingLink: json["meeting_link"],
        ccode: json["ccode"],
        phoneNumber: json["phone_number"],
        company: json["company"],
        contactId: json["contact_id"],
        userId: json["user_id"],
        rescheduleHistory: json["reschedule_history"] == null
            ? []
            : List<dynamic>.from(json["reschedule_history"]!.map((x) => x)),
        staffEmail: json["staff_email"],
        customerMeetingReminderEventSchedulerDetails:
            json["customer_meeting_reminder_event_scheduler_details"] == null
                ? []
                : List<dynamic>.from(
                    json["customer_meeting_reminder_event_scheduler_details"]!
                        .map((x) => x)),
        staffMeetingReminderEventSchedulerDetails:
            json["staff_meeting_reminder_event_scheduler_details"] == null
                ? []
                : List<dynamic>.from(
                    json["staff_meeting_reminder_event_scheduler_details"]!
                        .map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "startStr": startStr?.toIso8601String(),
        "endStr": endStr?.toIso8601String(),
        "enduser_timezone": enduserTimezone,
        "booking_details": bookingDetails == null
            ? []
            : List<dynamic>.from(bookingDetails!.map((x) => x.toJson())),
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
        "info": info?.toJson(),
        "booking_status": bookingStatus,
        "booking_name": bookingName,
        "duration": duration,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "staff": staff,
        "staff_name": staffName,
        "name": name,
        "email": email,
        "guest_email": guestEmail == null
            ? []
            : List<dynamic>.from(guestEmail!.map((x) => x.toJson())),
        "meeting_id": meetingId,
        "description": description,
        "booking_id": bookingId,
        "appointment_id": appointmentId,
        "staff_timezone": staffTimezone,
        "time_zone": timeZone,
        "booking_start_time": bookingStartTime?.toIso8601String(),
        "booking_end_time": bookingEndTime?.toIso8601String(),
        "type": type,
        "meeting_link": meetingLink,
        "ccode": ccode,
        "phone_number": phoneNumber,
        "company": company,
        "contact_id": contactId,
        "user_id": userId,
        "reschedule_history": rescheduleHistory == null
            ? []
            : List<dynamic>.from(rescheduleHistory!.map((x) => x)),
        "staff_email": staffEmail,
        "customer_meeting_reminder_event_scheduler_details":
            customerMeetingReminderEventSchedulerDetails == null
                ? []
                : List<dynamic>.from(
                    customerMeetingReminderEventSchedulerDetails!
                        .map((x) => x)),
        "staff_meeting_reminder_event_scheduler_details":
            staffMeetingReminderEventSchedulerDetails == null
                ? []
                : List<dynamic>.from(
                    staffMeetingReminderEventSchedulerDetails!.map((x) => x)),
      };
}

class BookingDetail {
  String? id;
  String? organisation;
  dynamic department;
  bool? isActive;
  bool? status;
  dynamic deletedAt;
  dynamic deletedBy;
  DateTime? createdAt;
  dynamic createdBy;
  DateTime? updatedAt;
  dynamic updatedBy;
  Info? info;
  String? mediumType;
  String? twilioIdentifier;
  String? staffTwilioMeetingUrl;
  String? customerTwilioMeetingUrl;
  String? staffTwilioAccessToken;
  String? customerTwilioAccessToken;
  String? videoSdkRoomId;
  String? meetingLink;
  String? googleCaledarId;
  String? googleEventId;
  String? booking;

  BookingDetail({
    this.id,
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
    this.info,
    this.mediumType,
    this.twilioIdentifier,
    this.staffTwilioMeetingUrl,
    this.customerTwilioMeetingUrl,
    this.staffTwilioAccessToken,
    this.customerTwilioAccessToken,
    this.videoSdkRoomId,
    this.meetingLink,
    this.googleCaledarId,
    this.googleEventId,
    this.booking,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
        id: json["id"],
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
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        mediumType: json["medium_type"],
        twilioIdentifier: json["twilio_identifier"],
        staffTwilioMeetingUrl: json["staff_twilio_meeting_url"],
        customerTwilioMeetingUrl: json["customer_twilio_meeting_url"],
        staffTwilioAccessToken: json["staff_twilio_access_token"],
        customerTwilioAccessToken: json["customer_twilio_access_token"],
        videoSdkRoomId: json["video_sdk_room_id"],
        meetingLink: json["meeting_link"],
        googleCaledarId: json["google_caledar_id"],
        googleEventId: json["google_event_id"],
        booking: json["booking"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "info": info?.toJson(),
        "medium_type": mediumType,
        "twilio_identifier": twilioIdentifier,
        "staff_twilio_meeting_url": staffTwilioMeetingUrl,
        "customer_twilio_meeting_url": customerTwilioMeetingUrl,
        "staff_twilio_access_token": staffTwilioAccessToken,
        "customer_twilio_access_token": customerTwilioAccessToken,
        "video_sdk_room_id": videoSdkRoomId,
        "meeting_link": meetingLink,
        "google_caledar_id": googleCaledarId,
        "google_event_id": googleEventId,
        "booking": booking,
      };
}

class Info {
  Info();

  factory Info.fromJson(Map<String, dynamic> json) => Info();

  Map<String, dynamic> toJson() => {};
}

class GuestEmail {
  String? mail;

  GuestEmail({
    this.mail,
  });

  factory GuestEmail.fromJson(Map<String, dynamic> json) => GuestEmail(
        mail: json["mail"],
      );

  Map<String, dynamic> toJson() => {
        "mail": mail,
      };
}
