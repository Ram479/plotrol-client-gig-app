class CategoriesResponse {
  int? code;
  List<CategoryDetails>? details;
  String? message;
  bool? status;

  CategoriesResponse({this.code, this.details, this.message, this.status});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['details'] != null) {
      details = <CategoryDetails>[];
      json['details'].forEach((v) {
        details!.add(new CategoryDetails.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class CategoryDetails {
  int? categoryid;
  int? servicegroup;
  int? categorytype;
  String? categoryname;
  String? icon;
  String? serviceimage;
  int? status;

  CategoryDetails(
      {this.categoryid,
        this.servicegroup,
        this.categorytype,
        this.categoryname,
        this.icon,
        this.serviceimage,
        this.status});

  CategoryDetails.fromJson(Map<String, dynamic> json) {
    categoryid = json['categoryid'];
    servicegroup = json['servicegroup'];
    categorytype = json['categorytype'];
    categoryname = json['categoryname'];
    icon = json['icon'];
    serviceimage = json['serviceimage'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryid'] = this.categoryid;
    data['servicegroup'] = this.servicegroup;
    data['categorytype'] = this.categorytype;
    data['categoryname'] = this.categoryname;
    data['icon'] = this.icon;
    data['serviceimage'] = this.serviceimage;
    data['status'] = this.status;
    return data;
  }
}
