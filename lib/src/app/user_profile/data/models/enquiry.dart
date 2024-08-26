class EnquiryModel {
  int? status;
  String? message;
  List<Enquiry>? data;

  EnquiryModel({
    this.status,
    this.message,
    this.data,
  });

  factory EnquiryModel.fromJson(Map<String, dynamic> json) => EnquiryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Enquiry>.from(json["data"]!.map((x) => Enquiry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Enquiry {
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
  String? enquiryId;
  bool? isContactActive;
  dynamic country;
  String? owner;
  String? ownerDepartment;
  String? requirementTitle;
  dynamic requirementDescription;
  dynamic budget;
  dynamic currency;
  List<String>? product;
  String? channel;
  String? type;
  dynamic dueDate;
  String? description;
  DateTime? refferedBy;
  List<dynamic>? assignee;
  List<dynamic>? assigneeDepartment;
  List<dynamic>? productCategory;
  dynamic lostText;
  dynamic priority;
  List<dynamic>? scheduler;
  List<dynamic>? schedulerCategory;
  List<dynamic>? service;
  List<dynamic>? serviceCategory;
  String? contact;
  dynamic tags;
  dynamic company;
  dynamic lostReason;

  Enquiry({
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
    this.enquiryId,
    this.isContactActive,
    this.country,
    this.owner,
    this.ownerDepartment,
    this.requirementTitle,
    this.requirementDescription,
    this.budget,
    this.currency,
    this.product,
    this.channel,
    this.type,
    this.dueDate,
    this.description,
    this.refferedBy,
    this.assignee,
    this.assigneeDepartment,
    this.productCategory,
    this.lostText,
    this.priority,
    this.scheduler,
    this.schedulerCategory,
    this.service,
    this.serviceCategory,
    this.contact,
    this.tags,
    this.company,
    this.lostReason,
  });

  factory Enquiry.fromJson(Map<String, dynamic> json) => Enquiry(
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
        enquiryId: json["enquiry_id"],
        isContactActive: json["is_contact_active"],
        country: json["country"],
        owner: json["owner"],
        ownerDepartment: json["owner_department"],
        requirementTitle: json["requirement_title"],
        requirementDescription: json["requirement_description"],
        budget: json["budget"],
        currency: json["currency"],
        product: json["product"] == null
            ? []
            : List<String>.from(json["product"]!.map((x) => x)),
        channel: json["channel"],
        type: json["type"],
        dueDate: json["due_date"],
        description: json["description"],
        refferedBy: json["reffered_by"] == null
            ? null
            : DateTime.parse(json["reffered_by"]),
        assignee: json["assignee"] == null
            ? []
            : List<dynamic>.from(json["assignee"]!.map((x) => x)),
        assigneeDepartment: json["assignee_department"] == null
            ? []
            : List<dynamic>.from(json["assignee_department"]!.map((x) => x)),
        productCategory: json["product_category"] == null
            ? []
            : List<dynamic>.from(json["product_category"]!.map((x) => x)),
        lostText: json["lost_text"],
        priority: json["priority"],
        scheduler: json["scheduler"] == null
            ? []
            : List<dynamic>.from(json["scheduler"]!.map((x) => x)),
        schedulerCategory: json["scheduler_category"] == null
            ? []
            : List<dynamic>.from(json["scheduler_category"]!.map((x) => x)),
        service: json["service"] == null
            ? []
            : List<dynamic>.from(json["service"]!.map((x) => x)),
        serviceCategory: json["service_category"] == null
            ? []
            : List<dynamic>.from(json["service_category"]!.map((x) => x)),
        contact: json["contact"],
        tags: json["tags"],
        company: json["company"],
        lostReason: json["lost_reason"],
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
        "enquiry_id": enquiryId,
        "is_contact_active": isContactActive,
        "country": country,
        "owner": owner,
        "owner_department": ownerDepartment,
        "requirement_title": requirementTitle,
        "requirement_description": requirementDescription,
        "budget": budget,
        "currency": currency,
        "product":
            product == null ? [] : List<dynamic>.from(product!.map((x) => x)),
        "channel": channel,
        "type": type,
        "due_date": dueDate,
        "description": description,
        "reffered_by": refferedBy?.toIso8601String(),
        "assignee":
            assignee == null ? [] : List<dynamic>.from(assignee!.map((x) => x)),
        "assignee_department": assigneeDepartment == null
            ? []
            : List<dynamic>.from(assigneeDepartment!.map((x) => x)),
        "product_category": productCategory == null
            ? []
            : List<dynamic>.from(productCategory!.map((x) => x)),
        "lost_text": lostText,
        "priority": priority,
        "scheduler": scheduler == null
            ? []
            : List<dynamic>.from(scheduler!.map((x) => x)),
        "scheduler_category": schedulerCategory == null
            ? []
            : List<dynamic>.from(schedulerCategory!.map((x) => x)),
        "service":
            service == null ? [] : List<dynamic>.from(service!.map((x) => x)),
        "service_category": serviceCategory == null
            ? []
            : List<dynamic>.from(serviceCategory!.map((x) => x)),
        "contact": contact,
        "tags": tags,
        "company": company,
        "lost_reason": lostReason,
      };
}

class Info {
  Info();

  factory Info.fromJson(Map<String, dynamic> json) => Info();

  Map<String, dynamic> toJson() => {};
}
