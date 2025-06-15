class AddYourPropertiesRequest {
  int? locationid;
  String? tenantid;
  int? moduleid;
  int? applocationid;
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
  String? notes;
  List<String>? tenantimage;

  AddYourPropertiesRequest(
      {this.locationid,
        this.tenantid,
        this.moduleid,
        this.applocationid,
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
        this.cancelsecs,
        this.notes,
        this.tenantimage});

  AddYourPropertiesRequest.fromJson(Map<String, dynamic> json) {
    locationid = json['locationid'];
    tenantid = json['tenantid'];
    moduleid = json['moduleid'];
    applocationid = json['applocationid'];
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
    notes = json['notes'];
    tenantimage = json['tenantimage'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationid'] = this.locationid;
    data['tenantid'] = this.tenantid;
    data['moduleid'] = this.moduleid;
    data['applocationid'] = this.applocationid;
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
    data['notes'] = this.notes;
    data['tenantimage'] = this.tenantimage;
    return data;
  }
}
