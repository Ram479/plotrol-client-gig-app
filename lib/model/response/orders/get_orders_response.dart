class GetOrders {
  int? code;
  List<OrderDetails>? details;
  String? message;
  bool? status;

  GetOrders({this.code, this.details, this.message, this.status});

  GetOrders.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['details'] != null) {
      details = <OrderDetails>[];
      json['details'].forEach((v) {
        details!.add(new OrderDetails.fromJson(v));
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

class OrderDetails {
  int? orderheaderid;
  int? applocationid;
  String? applocation;
  int? tenantid;
  int? partnerid;
  int? locationid;
  List<String>? categoryid;
  int? subcategoryid;
  List<String>? categoryname;
  int? moduleid;
  int? configid;
  String? orderid;
  String? orderdate;
  String? deliverydate;
  String? orderstatus;
  String? deliverystatus;
  int? itemcount;
  String? ordernotes;
  String? kms;
  String? actualkms;
  String? pending;
  String? processing;
  String? ready;
  String? completed;
  String? cancelled;
  String? delivered;
  String? assigntime;
  String? starttime;
  String? arrivaltime;
  String? pickuptime;
  String? deliverytime;
  String? canceltime;
  List<String>? orderimages;
  String? latitude;
  String? longitude;
  String? tenantname;
  String? tenanttoken;
  String? tenantsuburb;
  String? tenantcity;
  String? tenantcontactno;
  String? tenantpostcode;
  String? locationname;
  String? locationsuburb;
  String? locationcity;
  String? locationcontactno;
  String? orderamount;
  String? startdate;
  List<String>? tenantimage;
  String? address;
  String? firstname;
  String? lastname;
  String? profileimage;
  String? email;
  String? suburb;
  String? city;
  String? state;
  String? contactno;

  OrderDetails(
      {this.orderheaderid,
        this.applocationid,
        this.applocation,
        this.tenantid,
        this.partnerid,
        this.locationid,
        this.categoryid,
        this.subcategoryid,
        this.categoryname,
        this.moduleid,
        this.configid,
        this.orderid,
        this.orderdate,
        this.deliverydate,
        this.orderstatus,
        this.deliverystatus,
        this.itemcount,
        this.ordernotes,
        this.kms,
        this.actualkms,
        this.pending,
        this.processing,
        this.ready,
        this.completed,
        this.cancelled,
        this.delivered,
        this.assigntime,
        this.starttime,
        this.arrivaltime,
        this.pickuptime,
        this.deliverytime,
        this.canceltime,
        this.orderimages,
        this.latitude,
        this.longitude,
        this.tenantname,
        this.tenanttoken,
        this.tenantsuburb,
        this.tenantcity,
        this.tenantcontactno,
        this.tenantpostcode,
        this.locationname,
        this.locationsuburb,
        this.locationcity,
        this.locationcontactno,
        this.orderamount,
        this.startdate,
        this.tenantimage,
        this.address,
        this.firstname,
        this.lastname,
        this.profileimage,
        this.email,
        this.suburb,
        this.city,
        this.state,
        this.contactno});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderheaderid = json['orderheaderid'];
    applocationid = json['applocationid'];
    applocation = json['applocation'];
    tenantid = json['tenantid'];
    partnerid = json['partnerid'];
    locationid = json['locationid'];
    categoryid = json['categoryid']?.cast<String>();
    subcategoryid = json['subcategoryid'];
    categoryname = json['categoryname']?.cast<String>();
    moduleid = json['moduleid'];
    configid = json['configid'];
    orderid = json['orderid'];
    orderdate = json['orderdate'];
    deliverydate = json['deliverydate'];
    orderstatus = json['orderstatus'];
    deliverystatus = json['deliverystatus'];
    itemcount = json['itemcount'];
    ordernotes = json['ordernotes'];
    kms = json['kms'];
    actualkms = json['actualkms'];
    pending = json['Pending'];
    processing = json['processing'];
    ready = json['ready'];
    completed = json['completed'];
    cancelled = json['cancelled'];
    delivered = json['delivered'];
    assigntime = json['assigntime'];
    starttime = json['starttime'];
    arrivaltime = json['arrivaltime'];
    pickuptime = json['pickuptime'];
    deliverytime = json['deliverytime'];
    canceltime = json['canceltime'];
    orderimages = json['orderimages']?.cast<String>();
    latitude = json['latitude'];
    longitude = json['longitude'];
    tenantname = json['tenantname'];
    tenanttoken = json['tenanttoken'];
    tenantsuburb = json['tenantsuburb'];
    tenantcity = json['tenantcity'];
    tenantcontactno = json['tenantcontactno'];
    tenantpostcode = json['tenantpostcode'];
    locationname = json['locationname'];
    locationsuburb = json['locationsuburb'];
    locationcity = json['locationcity'];
    locationcontactno = json['locationcontactno'];
    orderamount = json['orderamount'];
    startdate = json['startdate'];
    tenantimage = json['tenantimage']?.cast<String>();
    address = json['address'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    profileimage = json['profileimage'];
    email = json['email'];
    suburb = json['suburb'];
    city = json['city'];
    state = json['state'];
    contactno = json['Contactno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderheaderid'] = this.orderheaderid;
    data['applocationid'] = this.applocationid;
    data['applocation'] = this.applocation;
    data['tenantid'] = this.tenantid;
    data['partnerid'] = this.partnerid;
    data['locationid'] = this.locationid;
    data['categoryid'] = this.categoryid;
    data['subcategoryid'] = this.subcategoryid;
    data['categoryname'] = this.categoryname;
    data['moduleid'] = this.moduleid;
    data['configid'] = this.configid;
    data['orderid'] = this.orderid;
    data['orderdate'] = this.orderdate;
    data['deliverydate'] = this.deliverydate;
    data['orderstatus'] = this.orderstatus;
    data['deliverystatus'] = this.deliverystatus;
    data['itemcount'] = this.itemcount;
    data['ordernotes'] = this.ordernotes;
    data['kms'] = this.kms;
    data['actualkms'] = this.actualkms;
    data['Pending'] = this.pending;
    data['processing'] = this.processing;
    data['ready'] = this.ready;
    data['completed'] = this.completed;
    data['cancelled'] = this.cancelled;
    data['delivered'] = this.delivered;
    data['assigntime'] = this.assigntime;
    data['starttime'] = this.starttime;
    data['arrivaltime'] = this.arrivaltime;
    data['pickuptime'] = this.pickuptime;
    data['deliverytime'] = this.deliverytime;
    data['canceltime'] = this.canceltime;
    data['orderimages'] = this.orderimages;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['tenantname'] = this.tenantname;
    data['tenanttoken'] = this.tenanttoken;
    data['tenantsuburb'] = this.tenantsuburb;
    data['tenantcity'] = this.tenantcity;
    data['tenantcontactno'] = this.tenantcontactno;
    data['tenantpostcode'] = this.tenantpostcode;
    data['locationname'] = this.locationname;
    data['locationsuburb'] = this.locationsuburb;
    data['locationcity'] = this.locationcity;
    data['locationcontactno'] = this.locationcontactno;
    data['orderamount'] = this.orderamount;
    data['startdate'] = this.startdate;
    data['tenantimage'] = this.tenantimage;
    data['address'] = this.address;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['profileimage'] = this.profileimage;
    data['email'] = this.email;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    data['state'] = this.state;
    data['Contactno'] = this.contactno;
    return data;
  }
}
