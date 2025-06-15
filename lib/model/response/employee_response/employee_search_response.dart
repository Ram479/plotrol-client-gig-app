import 'package:plotrol/model/response/autentication_response/autentication_response.dart';

import '../common_models.dart';

class EmployeeResponse {
  List<Employee> employees;

  EmployeeResponse({required this.employees});

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeResponse(
      employees: (json['Employees'] as List<dynamic>?)
          ?.map((e) => Employee.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Employees': employees.map((e) => e.toJson()).toList(),
    };
  }
}

class Employee {
  int? id;
  String? uuid;
  String? code;
  String? employeeStatus;
  String? employeeType;
  int? dateOfAppointment;
  List<Jurisdiction> jurisdictions;
  List<Assignment> assignments;
  List<dynamic> serviceHistory;
  List<dynamic> education;
  List<dynamic> tests;
  String? tenantId;
  List<dynamic> documents;
  List<dynamic> deactivationDetails;
  List<dynamic> reactivationDetails;
  AuditDetails? auditDetails;
  bool? reActivateEmployee;
  UserRequest? user;
  bool? isActive;

  Employee({
    this.id,
    this.uuid,
    this.code,
    this.employeeStatus,
    this.employeeType,
    this.dateOfAppointment,
    this.tenantId,
    this.reActivateEmployee,
    this.user,
    this.auditDetails,
    this.isActive,
    this.jurisdictions = const [],
    this.assignments = const [],
    this.serviceHistory = const [],
    this.education = const [],
    this.tests = const [],
    this.documents = const [],
    this.deactivationDetails = const [],
    this.reactivationDetails = const [],
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      uuid: json['uuid'],
      code: json['code'],
      employeeStatus: json['employeeStatus'],
      employeeType: json['employeeType'],
      dateOfAppointment: json['dateOfAppointment'],
      tenantId: json['tenantId'],
      reActivateEmployee: json['reActivateEmployee'],
      isActive: json['isActive'],
      jurisdictions: (json['jurisdictions'] as List<dynamic>?)
          ?.map((e) => Jurisdiction.fromJson(e))
          .toList() ??
          [],
      assignments: (json['assignments'] as List<dynamic>?)
          ?.map((e) => Assignment.fromJson(e))
          .toList() ??
          [],
      serviceHistory: json['serviceHistory'] ?? [],
      education: json['education'] ?? [],
      tests: json['tests'] ?? [],
      documents: json['documents'] ?? [],
      deactivationDetails: json['deactivationDetails'] ?? [],
      reactivationDetails: json['reactivationDetails'] ?? [],
      auditDetails: json['auditDetails'] != null
          ? AuditDetails.fromJson(json['auditDetails'])
          : null,
      user: json['user'] != null ? UserRequest.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'code': code,
      'employeeStatus': employeeStatus,
      'employeeType': employeeType,
      'dateOfAppointment': dateOfAppointment,
      'tenantId': tenantId,
      'reActivateEmployee': reActivateEmployee,
      'isActive': isActive,
      'jurisdictions': jurisdictions.map((e) => e.toJson()).toList(),
      'assignments': assignments.map((e) => e.toJson()).toList(),
      'serviceHistory': serviceHistory,
      'education': education,
      'tests': tests,
      'documents': documents,
      'deactivationDetails': deactivationDetails,
      'reactivationDetails': reactivationDetails,
      'auditDetails': auditDetails?.toJson(),
      'user': user?.toJson(),
    };
  }
}

class Jurisdiction {
  String? id;
  String? hierarchy;
  String? boundary;
  String? boundaryType;
  String? tenantId;
  AuditDetails? auditDetails;
  bool? isActive;

  Jurisdiction({
    this.id,
    this.hierarchy,
    this.boundary,
    this.boundaryType,
    this.tenantId,
    this.auditDetails,
    this.isActive,
  });

  factory Jurisdiction.fromJson(Map<String, dynamic> json) {
    return Jurisdiction(
      id: json['id'],
      hierarchy: json['hierarchy'],
      boundary: json['boundary'],
      boundaryType: json['boundaryType'],
      tenantId: json['tenantId'],
      auditDetails: json['auditDetails'] != null
          ? AuditDetails.fromJson(json['auditDetails'])
          : null,
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hierarchy': hierarchy,
      'boundary': boundary,
      'boundaryType': boundaryType,
      'tenantId': tenantId,
      'auditDetails': auditDetails?.toJson(),
      'isActive': isActive,
    };
  }
}

class Assignment {
  String? id;
  int? position;
  String? designation;
  String? department;
  int? fromDate;
  int? toDate;
  String? govtOrderNumber;
  String? tenantid;
  String? reportingTo;
  AuditDetails? auditDetails;
  bool? isHOD;
  bool? isCurrentAssignment;

  Assignment({
    this.id,
    this.position,
    this.designation,
    this.department,
    this.fromDate,
    this.toDate,
    this.govtOrderNumber,
    this.tenantid,
    this.reportingTo,
    this.auditDetails,
    this.isHOD,
    this.isCurrentAssignment,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id: json['id'],
      position: json['position'],
      designation: json['designation'],
      department: json['department'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      govtOrderNumber: json['govtOrderNumber'],
      tenantid: json['tenantid'],
      reportingTo: json['reportingTo'],
      auditDetails: json['auditDetails'] != null
          ? AuditDetails.fromJson(json['auditDetails'])
          : null,
      isHOD: json['isHOD'],
      isCurrentAssignment: json['isCurrentAssignment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'position': position,
      'designation': designation,
      'department': department,
      'fromDate': fromDate,
      'toDate': toDate,
      'govtOrderNumber': govtOrderNumber,
      'tenantid': tenantid,
      'reportingTo': reportingTo,
      'auditDetails': auditDetails?.toJson(),
      'isHOD': isHOD,
      'isCurrentAssignment': isCurrentAssignment,
    };
  }
}
