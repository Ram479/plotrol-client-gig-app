import '../common_models.dart';

class IndividualsResponse {
  List<Individual>? individuals;

  IndividualsResponse({this.individuals});

  IndividualsResponse.fromJson(Map<String, dynamic> json) {
    if (json['Individual'] != null) {
      individuals = <Individual>[];
      json['Individual'].forEach((v) {
        individuals!.add(Individual.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (individuals != null) {
      data['Individual'] = individuals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Individual {
  String? id;
  String? individualId;
  String? tenantId;
  String? clientReferenceId;
  String? userId;
  String? userUuid;
  Name? name;
  int? rowVersion;
  String? dateOfBirth;
  String? gender;
  String? bloodGroup;
  String? mobileNumber;
  String? altContactNumber;
  String? email;
  List<Address>? address;
  String? fatherName;
  String? husbandName;
  String? relationship;
  List<Identifier>? identifiers;
  List<Skill>? skills;
  String? photo;
  AdditionalFields? additionalFields;
  bool? isDeleted;
  bool? isSystemUser;
  bool? nonRecoverableError;
  AuditDetails? auditDetails;
  AuditDetails? clientAuditDetails;


  Individual({
    this.id,
    this.individualId,
    this.tenantId,
    this.clientReferenceId,
    this.userId,
    this.name,
    this.dateOfBirth,
    this.gender,
    this.bloodGroup,
    this.mobileNumber,
    this.altContactNumber,
    this.email,
    this.address,
    this.fatherName,
    this.husbandName,
    this.relationship,
    this.rowVersion,
    this.identifiers,
    this.skills,
    this.userUuid,
    this.photo,
    this.additionalFields,
    this.isDeleted = false,
    this.isSystemUser = false,
    this.auditDetails,
    this.nonRecoverableError = false,
    this.clientAuditDetails,
  });

  Individual.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    individualId = json['individualId'];
    tenantId = json['tenantId'];
    clientReferenceId = json['clientReferenceId'];
    userId = json['userId'];
    userUuid = json['userUuid'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    bloodGroup = json['bloodGroup'];
    mobileNumber = json['mobileNumber'];
    altContactNumber = json['altContactNumber'];
    email = json['email'];
    rowVersion = json['rowVersion'];
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
    fatherName = json['fatherName'];
    husbandName = json['husbandName'];
    relationship = json['relationship'];
    nonRecoverableError = json['nonRecoverableError'];
    if (json['identifiers'] != null) {
      identifiers = <Identifier>[];
      json['identifiers'].forEach((v) {
        identifiers!.add(Identifier.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skill>[];
      json['skills'].forEach((v) {
        skills!.add(Skill.fromJson(v));
      });
    }
    photo = json['photo'];
    additionalFields = json['additionalFields'] != null
        ? AdditionalFields.fromJson(json['additionalFields'])
        : null;
    isDeleted = json['isDeleted'];
    isSystemUser = json['isSystemUser'];
    auditDetails = json['auditDetails'] != null
        ? AuditDetails.fromJson(json['auditDetails'])
        : null;
    clientAuditDetails = json['clientAuditDetails'] != null
        ? AuditDetails.fromJson(json['clientAuditDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['individualId'] = individualId;
    data['tenantId'] = tenantId;
    data['clientReferenceId'] = clientReferenceId;
    data['userId'] = userId;
    data['nonRecoverableError'] = nonRecoverableError;
    if (name != null) data['name'] = name!.toJson();
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['rowVersion'] = rowVersion;
    data['bloodGroup'] = bloodGroup;
    data['mobileNumber'] = mobileNumber;
    data['altContactNumber'] = altContactNumber;
    data['email'] = email;
    data['userUuid'] = userUuid;
    if (address != null) {
      data['address'] = address!.map((e) => e.toJson()).toList();
    }
    data['fatherName'] = fatherName;
    data['husbandName'] = husbandName;
    data['relationship'] = relationship;
    if (identifiers != null) {
      data['identifiers'] = identifiers!.map((e) => e.toJson()).toList();
    }
    if (skills != null) {
      data['skills'] = skills!.map((e) => e.toJson()).toList();
    }
    data['photo'] = photo;
    if (additionalFields != null) {
      data['additionalFields'] = additionalFields!.toJson();
    }
    data['isDeleted'] = isDeleted;
    data['isSystemUser'] = isSystemUser;
    if (auditDetails != null) {
      data['auditDetails'] = auditDetails!.toJson();
    }
    if (clientAuditDetails != null) {
      data['clientAuditDetails'] = clientAuditDetails!.toJson();
    }
    return data;
  }
}

class Name {
  String? givenName;
  String? familyName;
  String? otherNames;

  Name({this.givenName, this.familyName, this.otherNames});

  Name.fromJson(Map<String, dynamic> json) {
    givenName = json['givenName'];
    familyName = json['familyName'];
    otherNames = json['otherNames'];
  }

  Map<String, dynamic> toJson() {
    return {
      'givenName': givenName,
      'familyName': familyName,
      'otherNames': otherNames,
    };
  }
}

class Identifier {
  String? identifierType;
  String? identifierId;
  String? clientReferenceId;

  Identifier({this.identifierType = 'DEFAULT', this.identifierId, this.clientReferenceId,});

  Identifier.fromJson(Map<String, dynamic> json) {
    identifierType = json['identifierType'];
    identifierId = json['identifierId'];
    clientReferenceId = json['clientReferenceId'];

  }

  Map<String, dynamic> toJson() {
    return {
      'identifierType': identifierType,
      'identifierId': identifierId,
      'clientReferenceId': clientReferenceId,
    };
  }
}

class Skill {
  String? id;
  String? type;
  String? level;
  String? experience;

  Skill({this.id, this.type, this.level, this.experience});

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    level = json['level'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'level': level,
      'experience': experience,
    };
  }
}


