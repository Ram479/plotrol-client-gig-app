class CreateAccountResponse {
  int? code;
  Details? details;
  String? message;
  bool? status;

  CreateAccountResponse({this.code, this.details, this.message, this.status});

  CreateAccountResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Details {
  int? tenantid;
  String? tenantname;
  String? tenanttype;
  String? registrationno;
  String? tenanttoken;
  String? companyname;
  String? primaryemail;
  String? primarycontact;
  int? categoryid;
  int? subcategoryid;
  String? address;
  String? suburb;
  String? city;
  String? state;
  String? postcode;
  String? latitude;
  String? longitude;
  String? tenantimage;
  String? tenantinfo;
  int? paymenttype;
  int? paymode1;
  int? paymode2;
  int? promotion;
  int? partnerid;
  int? minorder;
  int? applolcationid;
  String? applocation;
  int? approved;
  int? moduleid;
  String? subcategoryname;
  String? firstname;
  String? lastname;
  String? accountname;
  String? status;
  int? allocationid;
  String? allocationtype;
  int? allocationmode;

  Details(
      {this.tenantid,
        this.tenantname,
        this.tenanttype,
        this.registrationno,
        this.tenanttoken,
        this.companyname,
        this.primaryemail,
        this.primarycontact,
        this.categoryid,
        this.subcategoryid,
        this.address,
        this.suburb,
        this.city,
        this.state,
        this.postcode,
        this.latitude,
        this.longitude,
        this.tenantimage,
        this.tenantinfo,
        this.paymenttype,
        this.paymode1,
        this.paymode2,
        this.promotion,
        this.partnerid,
        this.minorder,
        this.applolcationid,
        this.applocation,
        this.approved,
        this.moduleid,
        this.subcategoryname,
        this.firstname,
        this.lastname,
        this.accountname,
        this.status,
        this.allocationid,
        this.allocationtype,
        this.allocationmode});

  Details.fromJson(Map<String, dynamic> json) {
    tenantid = json['tenantid'];
    tenantname = json['tenantname'];
    tenanttype = json['tenanttype'];
    registrationno = json['registrationno'];
    tenanttoken = json['tenanttoken'];
    companyname = json['companyname'];
    primaryemail = json['primaryemail'];
    primarycontact = json['primarycontact'];
    categoryid = json['categoryid'];
    subcategoryid = json['subcategoryid'];
    address = json['address'];
    suburb = json['suburb'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    tenantimage = json['tenantimage'];
    tenantinfo = json['tenantinfo'];
    paymenttype = json['paymenttype'];
    paymode1 = json['paymode1'];
    paymode2 = json['paymode2'];
    promotion = json['promotion'];
    partnerid = json['partnerid'];
    minorder = json['minorder'];
    applolcationid = json['applolcationid'];
    applocation = json['applocation'];
    approved = json['approved'];
    moduleid = json['moduleid'];
    subcategoryname = json['subcategoryname'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    accountname = json['Accountname'];
    status = json['status'];
    allocationid = json['allocationid'];
    allocationtype = json['allocationtype'];
    allocationmode = json['allocationmode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantid'] = this.tenantid;
    data['tenantname'] = this.tenantname;
    data['tenanttype'] = this.tenanttype;
    data['registrationno'] = this.registrationno;
    data['tenanttoken'] = this.tenanttoken;
    data['companyname'] = this.companyname;
    data['primaryemail'] = this.primaryemail;
    data['primarycontact'] = this.primarycontact;
    data['categoryid'] = this.categoryid;
    data['subcategoryid'] = this.subcategoryid;
    data['address'] = this.address;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['tenantimage'] = this.tenantimage;
    data['tenantinfo'] = this.tenantinfo;
    data['paymenttype'] = this.paymenttype;
    data['paymode1'] = this.paymode1;
    data['paymode2'] = this.paymode2;
    data['promotion'] = this.promotion;
    data['partnerid'] = this.partnerid;
    data['minorder'] = this.minorder;
    data['applolcationid'] = this.applolcationid;
    data['applocation'] = this.applocation;
    data['approved'] = this.approved;
    data['moduleid'] = this.moduleid;
    data['subcategoryname'] = this.subcategoryname;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['Accountname'] = this.accountname;
    data['status'] = this.status;
    data['allocationid'] = this.allocationid;
    data['allocationtype'] = this.allocationtype;
    data['allocationmode'] = this.allocationmode;
    return data;
  }
}
