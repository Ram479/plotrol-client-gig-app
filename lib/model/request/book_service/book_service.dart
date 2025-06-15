class BookServiceRequest {
  int? orderheaderid;
  String? tenantid;
  int? locationid;
  int? partnerid;
  int? moduleid;
  int? configid;
  List<String>? categoryid;
  int? subcategoryid;
  List<String>? categoryname;
  String? orderid;
  int? customerid;
  String? orderdate;
  String? orderstatus;
  String? pending;
  String? processing;
  String? ready;
  String? delivered;
  String? cancelled;
  int? promoid;
  String? promoname;
  String? promoterms;
  int? promovalue;
  int? promoamount;
  int? orderamount;
  int? taxamount;
  int? ordercharges;
  int? ordervalue;
  int? itemcount;
  int? paymenttype;
  int? paymentstatus;
  int? deliverycharge;
  String? deliverytime;
  int? deliverylocationid;
  String? delivceryaddress;
  String? pickupaddress;
  String? pickuplat;
  String? pickuplong;
  String? deliverylat;
  String? deliverylong;
  String? ordernotes;
  String? remarks;
  String? startdate;
  String? enddate;
  String? tenantuserid;

  BookServiceRequest(
      {this.orderheaderid,
        this.tenantid,
        this.locationid,
        this.partnerid,
        this.moduleid,
        this.configid,
        this.categoryid,
        this.subcategoryid,
        this.categoryname,
        this.orderid,
        this.customerid,
        this.orderdate,
        this.orderstatus,
        this.pending,
        this.processing,
        this.ready,
        this.delivered,
        this.cancelled,
        this.promoid,
        this.promoname,
        this.promoterms,
        this.promovalue,
        this.promoamount,
        this.orderamount,
        this.taxamount,
        this.ordercharges,
        this.ordervalue,
        this.itemcount,
        this.paymenttype,
        this.paymentstatus,
        this.deliverycharge,
        this.deliverytime,
        this.deliverylocationid,
        this.delivceryaddress,
        this.pickupaddress,
        this.pickuplat,
        this.pickuplong,
        this.deliverylat,
        this.deliverylong,
        this.ordernotes,
        this.remarks,
        this.startdate,
        this.enddate,
        this.tenantuserid});

  BookServiceRequest.fromJson(Map<String, dynamic> json) {
    orderheaderid = json['orderheaderid'];
    tenantid = json['tenantid'];
    locationid = json['locationid'];
    partnerid = json['partnerid'];
    moduleid = json['moduleid'];
    configid = json['configid'];
    categoryid = json['categoryid']?.cast<String>();
    subcategoryid = json['subcategoryid'];
    categoryname = json['categoryname']?.cast<String>();
    orderid = json['orderid'];
    customerid = json['customerid'];
    orderdate = json['orderdate'];
    orderstatus = json['orderstatus'];
    pending = json['pending'];
    processing = json['processing'];
    ready = json['ready'];
    delivered = json['delivered'];
    cancelled = json['cancelled'];
    promoid = json['promoid'];
    promoname = json['promoname'];
    promoterms = json['promoterms'];
    promovalue = json['promovalue'];
    promoamount = json['promoamount'];
    orderamount = json['orderamount'];
    taxamount = json['taxamount'];
    ordercharges = json['ordercharges'];
    ordervalue = json['ordervalue'];
    itemcount = json['itemcount'];
    paymenttype = json['paymenttype'];
    paymentstatus = json['paymentstatus'];
    deliverycharge = json['deliverycharge'];
    deliverytime = json['deliverytime'];
    deliverylocationid = json['deliverylocationid'];
    delivceryaddress = json['delivceryaddress'];
    pickupaddress = json['pickupaddress'];
    pickuplat = json['pickuplat'];
    pickuplong = json['pickuplong'];
    deliverylat = json['deliverylat'];
    deliverylong = json['deliverylong'];
    ordernotes = json['ordernotes'];
    remarks = json['remarks'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    tenantuserid = json['tenantuserid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderheaderid'] = this.orderheaderid;
    data['tenantid'] = this.tenantid;
    data['locationid'] = this.locationid;
    data['partnerid'] = this.partnerid;
    data['moduleid'] = this.moduleid;
    data['configid'] = this.configid;
    data['categoryid'] = this.categoryid;
    data['subcategoryid'] = this.subcategoryid;
    data['categoryname'] = this.categoryname;
    data['orderid'] = this.orderid;
    data['customerid'] = this.customerid;
    data['orderdate'] = this.orderdate;
    data['orderstatus'] = this.orderstatus;
    data['pending'] = this.pending;
    data['processing'] = this.processing;
    data['ready'] = this.ready;
    data['delivered'] = this.delivered;
    data['cancelled'] = this.cancelled;
    data['promoid'] = this.promoid;
    data['promoname'] = this.promoname;
    data['promoterms'] = this.promoterms;
    data['promovalue'] = this.promovalue;
    data['promoamount'] = this.promoamount;
    data['orderamount'] = this.orderamount;
    data['taxamount'] = this.taxamount;
    data['ordercharges'] = this.ordercharges;
    data['ordervalue'] = this.ordervalue;
    data['itemcount'] = this.itemcount;
    data['paymenttype'] = this.paymenttype;
    data['paymentstatus'] = this.paymentstatus;
    data['deliverycharge'] = this.deliverycharge;
    data['deliverytime'] = this.deliverytime;
    data['deliverylocationid'] = this.deliverylocationid;
    data['delivceryaddress'] = this.delivceryaddress;
    data['pickupaddress'] = this.pickupaddress;
    data['pickuplat'] = this.pickuplat;
    data['pickuplong'] = this.pickuplong;
    data['deliverylat'] = this.deliverylat;
    data['deliverylong'] = this.deliverylong;
    data['ordernotes'] = this.ordernotes;
    data['remarks'] = this.remarks;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['tenantuserid'] = this.tenantuserid;
    return data;
  }
}
