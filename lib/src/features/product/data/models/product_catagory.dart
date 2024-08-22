class ProductCategoryModel {
  int? status;
  String? message;
  List<ProductCategory>? productCategory;
  int? count;
  int? pages;

  ProductCategoryModel({
    this.status,
    this.message,
    this.productCategory,
    this.count,
    this.pages,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => ProductCategoryModel(
        status: json["status"],
        message: json["message"],
        productCategory:
            json["data"] == null ? [] : List<ProductCategory>.from(json["data"]!.map((x) => ProductCategory.fromJson(x))),
        count: json["count"],
        pages: json["pages"],
      );
}

class ProductCategory {
  String? id;
  String? organisation;
  String? department;
  bool? isActive;
  int? noOfProducts;
  String? name;
  String? description;
  String? image;
  String? store;

  ProductCategory({
    this.id,
    this.organisation,
    this.department,
    this.isActive,
    this.noOfProducts,
    this.name,
    this.description,
    this.image,
    this.store,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
        id: json["id"],
        organisation: json["organisation"],
        department: json["department"],
        isActive: json["is_active"],
        noOfProducts: json["num_products"] is! int ? 0 : json["num_products"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        store: json["store"],
      );
}
