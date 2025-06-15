import 'package:plotrol/model/response/autentication_response/autentication_response.dart';

import '../common_models.dart';

class PgrServiceResponse {
  List<ServiceWrapper>? serviceWrappers;
  int? complaintsResolved;
  int? averageResolutionTime;
  int? complaintTypes;

  PgrServiceResponse({
    this.serviceWrappers,
    this.complaintsResolved,
    this.averageResolutionTime,
    this.complaintTypes,
  });

  PgrServiceResponse.fromJson(Map<String, dynamic> json) {
    if (json['ServiceWrappers'] != null) {
      serviceWrappers = <ServiceWrapper>[];
      json['ServiceWrappers'].forEach((v) {
        serviceWrappers!.add(ServiceWrapper.fromJson(v));
      });
    }
    complaintsResolved = json['complaintsResolved'];
    averageResolutionTime = json['averageResolutionTime'];
    complaintTypes = json['complaintTypes'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (serviceWrappers != null) {
      data['ServiceWrappers'] = serviceWrappers!.map((e) => e.toJson()).toList();
    }
    data['complaintsResolved'] = complaintsResolved;
    data['averageResolutionTime'] = averageResolutionTime;
    data['complaintTypes'] = complaintTypes;
    return data;
  }
}


class ServiceWrapper {
  Service? service;
  Workflow? workflow;
  List<String>? imageUrls;

  ServiceWrapper({this.service, this.workflow, this.imageUrls});

  ServiceWrapper.fromJson(Map<String, dynamic> json) {
    service = json['service'] != null ? Service.fromJson(json['service']) : null;
    workflow = json['workflow'] != null ? Workflow.fromJson(json['workflow']) : null;
    if (json['imageUrls'] != null) {
      imageUrls = List<String>.from(json['imageUrls']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service'] = service?.toJson();
    data['workflow'] = workflow?.toJson();
    if (imageUrls != null) {
      data['imageUrls'] = imageUrls;
    }
    return data;
  }
}

class Service {
  bool? active;
  UserRequest? user;
  String? id;
  String? tenantId;
  String? serviceCode;
  String? serviceRequestId;
  int? rowVersion;
  String? description;
  String? accountId;
  int? rating;
  String? additionalDetail;
  String? applicationStatus;
  String? source;
  Address? address;
  bool? isDeleted;
  AuditDetails? auditDetails;

  Service({this.active, this.user, this.id, this.tenantId, this.serviceCode, this.serviceRequestId, this.description, this.accountId, this.rating, this.additionalDetail, this.applicationStatus, this.source, this.address, this.auditDetails, this.rowVersion,this.isDeleted =false,});

  Service.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    user = json['user'] != null ? UserRequest.fromJson(json['user']) : null;
    id = json['id'];
    tenantId = json['tenantId'];
    rowVersion = json['rowVersion'];
    serviceCode = json['serviceCode'];
    isDeleted = json['isDeleted'];
    serviceRequestId = json['serviceRequestId'];
    description = json['description'];
    accountId = json['accountId'];
    rating = json['rating'];
    additionalDetail = json['additionalDetail'];
    applicationStatus = json['applicationStatus'];
    source = json['source'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    auditDetails = json['auditDetails'] != null ? AuditDetails.fromJson(json['auditDetails']) : null;
  }

  Map<String, dynamic> toJson() => {
    'active': active,
    'user': user?.toJson(),
    'id': id,
    'tenantId': tenantId,
    'serviceCode': serviceCode,
    'serviceRequestId': serviceRequestId,
    'description': description,
    'accountId': accountId,
    'rowVersion': rowVersion,
    'rating': rating,
    'isDeleted': isDeleted,
    'additionalDetail': additionalDetail,
    'applicationStatus': applicationStatus,
    'source': source,
    'address': address?.toJson(),
    'auditDetails': auditDetails?.toJson(),
  };
}


class Workflow {
  String? action;
  List<String?>? assignes;
  List<String?>? hrmsAssignes;
  String? comments;
  List<String?>? verificationDocuments;

  Workflow({this.action, this.assignes = const [], this.hrmsAssignes = const [], this.comments, this.verificationDocuments});

  Workflow.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    assignes = (json['assignes'] as List?)?.map((e) => e as String).toList() ?? [];
    hrmsAssignes = (json['hrmsAssignes'] as List?)?.map((e) => e as String).toList() ?? [];
    comments = json['comments'];
    verificationDocuments = (json['verificationDocuments'] as List?)?.map((e) => e as String?).toList();
  }


  Map<String, dynamic> toJson() => {
    'action': action,
    'assignes': assignes,
    'hrmsAssignes': hrmsAssignes,
    'comments': comments,
    'verificationDocuments': verificationDocuments,
  };
}