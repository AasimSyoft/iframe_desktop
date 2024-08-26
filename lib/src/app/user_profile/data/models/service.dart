class ClientProjectsModel {
  int? status;
  String? message;
  List<ClientProjects>? data;
  int? count;
  int? pages;

  ClientProjectsModel({
    this.status,
    this.message,
    this.data,
    this.count,
    this.pages,
  });

  factory ClientProjectsModel.fromJson(Map<String, dynamic> json) =>
      ClientProjectsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ClientProjects>.from(
                json["data"]!.map((x) => ClientProjects.fromJson(x))),
        count: json["count"],
        pages: json["pages"],
      );
}

class ClientProjects {
  String? id;
  OwnerInfo? ownerInfo;
  String? createdByName;
  String? updatedByName;
  bool? isActive;
  bool? status;
  dynamic deletedAt;
  String? name;
  String? description;
  double? cost;
  DateTime? dueDate;
  String? projectStatus;
  String? currency;

  ClientProjects({
    this.id,
    this.ownerInfo,
    this.createdByName,
    this.updatedByName,
    this.isActive,
    this.status,
    this.deletedAt,
    this.name,
    this.description,
    this.cost,
    this.dueDate,
    this.projectStatus,
    this.currency,
  });

  factory ClientProjects.fromJson(Map<String, dynamic> json) => ClientProjects(
        id: json["id"],
        ownerInfo: json["owner_info"] == null
            ? null
            : OwnerInfo.fromJson(json["owner_info"]),
        createdByName: json["created_by_name"],
        updatedByName: json["updated_by_name"],
        isActive: json["is_active"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        name: json["name"],
        description: json["description"],
        cost: json["cost"]?.toDouble(),
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        projectStatus: json["project_status"],
        currency: json["currency"],
      );
}

class OwnerInfo {
  String? id;
  String? fname;
  String? lname;
  String? email;

  OwnerInfo({
    this.id,
    this.fname,
    this.lname,
    this.email,
  });

  factory OwnerInfo.fromJson(Map<String, dynamic> json) => OwnerInfo(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
      );
}
