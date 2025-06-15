class EditProfileRequest {
  String? tenantid;
  int? partnerid;
  int? configid;
  String? tenantname;
  String? tenanttype;
  String? registrationno;
  String? devicetype;
  String? deviceid;
  String? tenanttoken;
  String? companyname;
  String? firstname;
  String? lastname;
  String? primaryemail;
  String? primarycontact;
  int? categoryid;
  int? subcategoryid;
  int? moduleid;
  String? address;
  String? suburb;
  String? state;
  String? city;
  String? postcode;
  String? latitude;
  String? longitude;
  int? applocationid;
  int? approved;
  String? tenantimage;
  Tenantlocations? tenantlocations;
  Tenantsubscriptions? tenantsubscriptions;

  EditProfileRequest(
      {this.tenantid,
        this.partnerid,
        this.configid,
        this.tenantname,
        this.tenanttype,
        this.registrationno,
        this.devicetype,
        this.deviceid,
        this.tenanttoken,
        this.companyname,
        this.firstname,
        this.lastname,
        this.primaryemail,
        this.primarycontact,
        this.categoryid,
        this.subcategoryid,
        this.moduleid,
        this.address,
        this.suburb,
        this.state,
        this.city,
        this.postcode,
        this.latitude,
        this.longitude,
        this.applocationid,
        this.approved,
        this.tenantimage,
        this.tenantlocations,
        this.tenantsubscriptions});

  EditProfileRequest.fromJson(Map<String, dynamic> json) {
    tenantid = json['tenantid'];
    partnerid = json['partnerid'];
    configid = json['configid'];
    tenantname = json['tenantname'];
    tenanttype = json['tenanttype'];
    registrationno = json['registrationno'];
    devicetype = json['devicetype'];
    deviceid = json['deviceid'];
    tenanttoken = json['tenanttoken'];
    companyname = json['companyname'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    primaryemail = json['primaryemail'];
    primarycontact = json['primarycontact'];
    categoryid = json['categoryid'];
    subcategoryid = json['subcategoryid'];
    moduleid = json['moduleid'];
    address = json['address'];
    suburb = json['suburb'];
    state = json['state'];
    city = json['city'];
    postcode = json['postcode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    applocationid = json['applocationid'];
    approved = json['approved'];
    tenantimage = json['tenantimage'];
    tenantlocations = json['tenantlocations'] != null
        ? new Tenantlocations.fromJson(json['tenantlocations'])
        : null;
    tenantsubscriptions = json['tenantsubscriptions'] != null
        ? new Tenantsubscriptions.fromJson(json['tenantsubscriptions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantid'] = this.tenantid;
    data['partnerid'] = this.partnerid;
    data['configid'] = this.configid;
    data['tenantname'] = this.tenantname;
    data['tenanttype'] = this.tenanttype;
    data['registrationno'] = this.registrationno;
    data['devicetype'] = this.devicetype;
    data['deviceid'] = this.deviceid;
    data['tenanttoken'] = this.tenanttoken;
    data['companyname'] = this.companyname;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['primaryemail'] = this.primaryemail;
    data['primarycontact'] = this.primarycontact;
    data['categoryid'] = this.categoryid;
    data['subcategoryid'] = this.subcategoryid;
    data['moduleid'] = this.moduleid;
    data['address'] = this.address;
    data['suburb'] = this.suburb;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['applocationid'] = this.applocationid;
    data['approved'] = this.approved;
    data['tenantimage'] = this.tenantimage;
    if (this.tenantlocations != null) {
      data['tenantlocations'] = this.tenantlocations!.toJson();
    }
    if (this.tenantsubscriptions != null) {
      data['tenantsubscriptions'] = this.tenantsubscriptions!.toJson();
    }
    return data;
  }
}

class Tenantlocations {
  int? locationid;
  int? applocationid;
  String? tenantid;
  int? moduleid;
  String? locationname;
  String? email;
  String? contactno;
  String? address;
  String? suburb;
  String? state;
  String? city;
  String? postcode;
  String? latitude;
  String? longitude;
  int? partnerid;
  String? opentime;
  String? closetime;
  int? deliverytype;
  int? deliverymins;
  int? cancelsecs;

  Tenantlocations(
      {this.locationid,
        this.applocationid,
        this.tenantid,
        this.moduleid,
        this.locationname,
        this.email,
        this.contactno,
        this.address,
        this.suburb,
        this.state,
        this.city,
        this.postcode,
        this.latitude,
        this.longitude,
        this.partnerid,
        this.opentime,
        this.closetime,
        this.deliverytype,
        this.deliverymins,
        this.cancelsecs});

  Tenantlocations.fromJson(Map<String, dynamic> json) {
    locationid = json['locationid'];
    applocationid = json['applocationid'];
    tenantid = json['tenantid'];
    moduleid = json['moduleid'];
    locationname = json['locationname'];
    email = json['email'];
    contactno = json['contactno'];
    address = json['address'];
    suburb = json['suburb'];
    state = json['state'];
    city = json['city'];
    postcode = json['postcode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    partnerid = json['partnerid'];
    opentime = json['opentime'];
    closetime = json['closetime'];
    deliverytype = json['deliverytype'];
    deliverymins = json['deliverymins'];
    cancelsecs = json['cancelsecs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationid'] = this.locationid;
    data['applocationid'] = this.applocationid;
    data['tenantid'] = this.tenantid;
    data['moduleid'] = this.moduleid;
    data['locationname'] = this.locationname;
    data['email'] = this.email;
    data['contactno'] = this.contactno;
    data['address'] = this.address;
    data['suburb'] = this.suburb;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['partnerid'] = this.partnerid;
    data['opentime'] = this.opentime;
    data['closetime'] = this.closetime;
    data['deliverytype'] = this.deliverytype;
    data['deliverymins'] = this.deliverymins;
    data['cancelsecs'] = this.cancelsecs;
    return data;
  }
}

class Tenantsubscriptions {
  int? subscriptionid;
  int? tenantid;
  String? transactiondate;
  int? moduleid;
  int? applocationid;
  int? categoryid;
  int? subcategoryid;
  String? validitydate;
  int? subscriptionprice;
  int? quantity;
  int? taxamount;
  int? taxpercent;
  int? totalamount;
  int? paymentstatus;

  Tenantsubscriptions(
      {this.subscriptionid,
        this.tenantid,
        this.transactiondate,
        this.moduleid,
        this.applocationid,
        this.categoryid,
        this.subcategoryid,
        this.validitydate,
        this.subscriptionprice,
        this.quantity,
        this.taxamount,
        this.taxpercent,
        this.totalamount,
        this.paymentstatus});

  Tenantsubscriptions.fromJson(Map<String, dynamic> json) {
    subscriptionid = json['subscriptionid'];
    tenantid = json['tenantid'];
    transactiondate = json['transactiondate'];
    moduleid = json['moduleid'];
    applocationid = json['applocationid'];
    categoryid = json['categoryid'];
    subcategoryid = json['subcategoryid'];
    validitydate = json['validitydate'];
    subscriptionprice = json['subscriptionprice'];
    quantity = json['quantity'];
    taxamount = json['taxamount'];
    taxpercent = json['taxpercent'];
    totalamount = json['totalamount'];
    paymentstatus = json['paymentstatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscriptionid'] = this.subscriptionid;
    data['tenantid'] = this.tenantid;
    data['transactiondate'] = this.transactiondate;
    data['moduleid'] = this.moduleid;
    data['applocationid'] = this.applocationid;
    data['categoryid'] = this.categoryid;
    data['subcategoryid'] = this.subcategoryid;
    data['validitydate'] = this.validitydate;
    data['subscriptionprice'] = this.subscriptionprice;
    data['quantity'] = this.quantity;
    data['taxamount'] = this.taxamount;
    data['taxpercent'] = this.taxpercent;
    data['totalamount'] = this.totalamount;
    data['paymentstatus'] = this.paymentstatus;
    return data;
  }
}
